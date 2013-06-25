'''Generate map code

For Python 2.7.
'''

from __future__ import print_function
import argparse
import fileinput
import textwrap

SENSOR_MODULE_A = 1
SENSOR_MODULE_E = 5
SENSORS_PER_MODULE = 16
SENSOR_COUNT = (SENSOR_MODULE_A + SENSOR_MODULE_E) * SENSORS_PER_MODULE


def main():
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument('map_file', help='Path of file')
    arg_parser.add_argument('track_name', help='A or B')

    args = arg_parser.parse_args()
    track_name = args.track_name
    
    with open('map_%s.h' % track_name.lower(), 'wb') as out_f:
        out_f.write(textwrap.dedent('''\
        /* Automatically generated. Do not edit. */
        #include "map.h"
        #ifndef MAP_%s_H_
        #define MAP_%s_H_
        
        void TrainMap_Initialize_%s(TrainMap * map);
        #endif
        ''' % (track_name.upper(), track_name.upper(), track_name.upper())
        ))
        
    
    with open('map_%s.c' % track_name.lower(), 'wb') as out_f:
        out_f.write(textwrap.dedent('''\
        /* Automatically generated. Do not edit. */
        #include "map_%s.h"
        
        void TrainMap_Initialize_%s(TrainMap * map) {
        ''' % (track_name.lower(), track_name.upper())
        ))
    
        out_f.write('map->ascii = ""\n')
 
        lines = fileinput.input(args.map_file, mode='rU')
        map_text = ascii_map(out_f, lines)
        switch_numbers, sensor_numbers = waypoints(out_f, lines)
        fill_waypoint_positions(out_f, map_text, switch_numbers, sensor_numbers)
        
        out_f.write(textwrap.dedent('''\
        }
        '''))


def ascii_map(out_f, lines):
    map_text = []
    
    for line in lines:
        assert isinstance(line, bytes)

        if line.startswith('MAP END'):
            out_f.write(';\n')
            break
        elif line.startswith('#'):
            continue

        line = line.rstrip()
        map_text.append(line + '\n')
        line = line.replace('\\', '\\\\')
        out_f.write('"%s\\n"\n' % line)
    
    return map_text


def waypoints(out_f, lines):
    switch_numbers = []
    sensor_numbers = []

    for line in lines:
        line = line.split('#', 1)[0]
        
        if line.startswith('O'):
            waypoint_type, switch_number = line.split()
            switch_numbers.append(int(switch_number))
        elif line.startswith('X'):
            waypoint_type, sensor_module, sensor_left_number, sensor_right_number = line.split()
            sensor_module = int(sensor_module)
            sensor_left_number = int(sensor_left_number) - 1  # Norm to 0-index
            sensor_right_number = int(sensor_right_number) - 1
            sensor_numbers.append((sensor_module, sensor_left_number, sensor_right_number))

    return (switch_numbers, sensor_numbers)


def fill_waypoint_positions(out_f, map_text, switch_numbers, sensor_numbers):
    offset = 0

    for i in range(SENSOR_COUNT):
        out_f.write('map->sensors[%d].row = 0;\n' % i)
        out_f.write('map->sensors[%d].col = 0;\n' % i)
        out_f.write('map->sensors[%d].ascii_offset = 0;\n' % i)

    for switch_number in range(256):
        out_f.write('map->switches[%d].row = 0;\n' % switch_number)
        out_f.write('map->switches[%d].col = 0;\n' % switch_number)
        out_f.write('map->switches[%d].ascii_offset = 0;\n' % switch_number)

    for row in range(len(map_text)):
        line = map_text[row]

        for col in range(len(line)):
            char = map_text[row][col]

            if char == 'O' and switch_numbers:
                switch_number = switch_numbers.pop(0)
                out_f.write('map->switches[%d].row = %d;\n' % (switch_number, row))
                out_f.write('map->switches[%d].col = %d;\n' % (switch_number, col))
                out_f.write('map->switches[%d].ascii_offset = %d;\n' % (switch_number, offset))
            elif char == 'X' and sensor_numbers:
                sensor_module, sensor_left_number, sensor_right_number = sensor_numbers.pop(0)
                
                for i in [sensor_module * SENSORS_PER_MODULE + sensor_left_number, sensor_module * SENSORS_PER_MODULE + sensor_right_number]:
                    out_f.write('/* Module=%d SensorI=%d/%d SensorLabel=%d/%d */\n' % (sensor_module, sensor_left_number, sensor_right_number, sensor_left_number + 1, sensor_right_number + 1))
                    out_f.write('map->sensors[%d].row = %d;\n' % (i, row))
                    out_f.write('map->sensors[%d].col = %d;\n' % (i, col))
                    out_f.write('map->sensors[%d].ascii_offset = %d;\n' % (i, offset))
            
            offset += 1
    
    assert len(switch_numbers) == 0
    assert len(sensor_numbers) == 0

if __name__ == '__main__':
    main()
