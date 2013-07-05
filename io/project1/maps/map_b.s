	.file	"map_b.c"
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.text
.Ltext0:
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"----------X----O---------O----X-------O----X-------"
	.ascii	"--X--\012              /           \\            \\"
	.ascii	"\012      ---X---O-------------O---X---     O----X-"
	.ascii	"------X--\012     X                             \\ "
	.ascii	"    \\\012    O---X---X---O-X---X-O-----X-----O    "
	.ascii	" O----X-----X--\012   /             X     X        "
	.ascii	"     \\     \\\012  /               X | X          "
	.ascii	"     X     X\012 |                 O|O             "
	.ascii	"    |     |\012 |                  |               "
	.ascii	"   |     |\012 O                 O|O               "
	.ascii	"  |     |\012 |\\               X | X              "
	.ascii	" X     X\012 | X             X     X             / "
	.ascii	"    /\012 |  ------X-----O-X---X-O-----X-----O     "
	.ascii	"O----X--------\012  X                              "
	.ascii	"  /     /\012   -------X----------------X------O---"
	.ascii	"--O----X----------\012\000"
	.text
	.align	2
	.global	TrainMap_Initialize_B
	.type	TrainMap_Initialize_B, %function
TrainMap_Initialize_B:
.LFB2:
	.file 1 "maps/map_b.c"
	.loc 1 4 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL0:
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI0:
	ldr	sl, .L4
	.loc 1 5 0
	ldr	r1, .L4+4
	.loc 1 4 0
.L3:
	add	sl, pc, sl
	.loc 1 22 0
	mov	r3, #0
	.loc 1 1207 0
	mov	r6, #10
	.loc 1 5 0
	add	ip, sl, r1
	.loc 1 520 0
	mov	r2, r3
	.loc 1 34 0
	str	r3, [r0, #3124]
	.loc 1 35 0
	str	r3, [r0, #3128]
	.loc 1 36 0
	str	r3, [r0, #3132]
	.loc 1 37 0
	str	r3, [r0, #3136]
	.loc 1 38 0
	str	r3, [r0, #3140]
	.loc 1 39 0
	str	r3, [r0, #3144]
	.loc 1 40 0
	str	r3, [r0, #3148]
	.loc 1 41 0
	str	r3, [r0, #3152]
	.loc 1 42 0
	str	r3, [r0, #3156]
	.loc 1 43 0
	str	r3, [r0, #3160]
	.loc 1 44 0
	str	r3, [r0, #3164]
	.loc 1 45 0
	str	r3, [r0, #3168]
	.loc 1 46 0
	str	r3, [r0, #3172]
	.loc 1 47 0
	str	r3, [r0, #3176]
	.loc 1 48 0
	str	r3, [r0, #3180]
	.loc 1 49 0
	str	r3, [r0, #3184]
	.loc 1 50 0
	str	r3, [r0, #3188]
	.loc 1 51 0
	str	r3, [r0, #3192]
	.loc 1 52 0
	str	r3, [r0, #3196]
	.loc 1 53 0
	str	r3, [r0, #3200]
	.loc 1 54 0
	str	r3, [r0, #3204]
	.loc 1 55 0
	str	r3, [r0, #3208]
	.loc 1 56 0
	str	r3, [r0, #3212]
	.loc 1 57 0
	str	r3, [r0, #3216]
	.loc 1 70 0
	str	r3, [r0, #3268]
	.loc 1 71 0
	str	r3, [r0, #3272]
	.loc 1 72 0
	str	r3, [r0, #3276]
	.loc 1 73 0
	str	r3, [r0, #3280]
	.loc 1 74 0
	str	r3, [r0, #3284]
	.loc 1 75 0
	str	r3, [r0, #3288]
	.loc 1 76 0
	str	r3, [r0, #3292]
	.loc 1 5 0
	str	ip, [r0, #0]
	.loc 1 77 0
	str	r3, [r0, #3296]
	.loc 1 78 0
	str	r3, [r0, #3300]
	.loc 1 79 0
	str	r3, [r0, #3304]
	.loc 1 80 0
	str	r3, [r0, #3308]
	.loc 1 81 0
	str	r3, [r0, #3312]
	.loc 1 88 0
	str	r3, [r0, #3340]
	.loc 1 89 0
	str	r3, [r0, #3344]
	.loc 1 90 0
	str	r3, [r0, #3348]
	.loc 1 91 0
	str	r3, [r0, #3352]
	.loc 1 92 0
	str	r3, [r0, #3356]
	.loc 1 93 0
	str	r3, [r0, #3360]
	.loc 1 94 0
	str	r3, [r0, #3364]
	.loc 1 95 0
	str	r3, [r0, #3368]
	.loc 1 96 0
	str	r3, [r0, #3372]
	.loc 1 97 0
	str	r3, [r0, #3376]
	.loc 1 98 0
	str	r3, [r0, #3380]
	.loc 1 99 0
	str	r3, [r0, #3384]
	.loc 1 100 0
	str	r3, [r0, #3388]
	.loc 1 101 0
	str	r3, [r0, #3392]
	.loc 1 102 0
	str	r3, [r0, #3396]
	.loc 1 103 0
	str	r3, [r0, #3400]
	.loc 1 104 0
	str	r3, [r0, #3404]
	.loc 1 105 0
	str	r3, [r0, #3408]
	.loc 1 106 0
	str	r3, [r0, #3412]
	.loc 1 107 0
	str	r3, [r0, #3416]
	.loc 1 108 0
	str	r3, [r0, #3420]
	.loc 1 109 0
	str	r3, [r0, #3424]
	.loc 1 110 0
	str	r3, [r0, #3428]
	.loc 1 111 0
	str	r3, [r0, #3432]
	.loc 1 112 0
	str	r3, [r0, #3436]
	.loc 1 113 0
	str	r3, [r0, #3440]
	.loc 1 114 0
	str	r3, [r0, #3444]
	.loc 1 115 0
	str	r3, [r0, #3448]
	.loc 1 116 0
	str	r3, [r0, #3452]
	.loc 1 117 0
	str	r3, [r0, #3456]
	.loc 1 118 0
	str	r3, [r0, #3460]
	.loc 1 119 0
	str	r3, [r0, #3464]
	.loc 1 120 0
	str	r3, [r0, #3468]
	.loc 1 121 0
	str	r3, [r0, #3472]
	.loc 1 122 0
	str	r3, [r0, #3476]
	.loc 1 123 0
	str	r3, [r0, #3480]
	.loc 1 124 0
	str	r3, [r0, #3484]
	.loc 1 125 0
	str	r3, [r0, #3488]
	.loc 1 126 0
	str	r3, [r0, #3492]
	.loc 1 127 0
	str	r3, [r0, #3496]
	.loc 1 128 0
	str	r3, [r0, #3500]
	.loc 1 129 0
	str	r3, [r0, #3504]
	.loc 1 130 0
	str	r3, [r0, #3508]
	.loc 1 131 0
	str	r3, [r0, #3512]
	.loc 1 132 0
	str	r3, [r0, #3516]
	.loc 1 133 0
	str	r3, [r0, #3520]
	.loc 1 134 0
	str	r3, [r0, #3524]
	.loc 1 135 0
	str	r3, [r0, #3528]
	.loc 1 136 0
	str	r3, [r0, #3532]
	.loc 1 137 0
	str	r3, [r0, #3536]
	.loc 1 138 0
	str	r3, [r0, #3540]
	.loc 1 139 0
	str	r3, [r0, #3544]
	.loc 1 140 0
	str	r3, [r0, #3548]
	.loc 1 141 0
	str	r3, [r0, #3552]
	.loc 1 142 0
	str	r3, [r0, #3556]
	.loc 1 143 0
	str	r3, [r0, #3560]
	.loc 1 144 0
	str	r3, [r0, #3564]
	.loc 1 145 0
	str	r3, [r0, #3568]
	.loc 1 146 0
	str	r3, [r0, #3572]
	.loc 1 147 0
	str	r3, [r0, #3576]
	.loc 1 160 0
	str	r3, [r0, #3628]
	.loc 1 161 0
	str	r3, [r0, #3632]
	.loc 1 162 0
	str	r3, [r0, #3636]
	.loc 1 163 0
	str	r3, [r0, #3640]
	.loc 1 164 0
	str	r3, [r0, #3644]
	.loc 1 165 0
	str	r3, [r0, #3648]
	.loc 1 166 0
	str	r3, [r0, #3652]
	.loc 1 167 0
	str	r3, [r0, #3656]
	.loc 1 168 0
	str	r3, [r0, #3660]
	.loc 1 169 0
	str	r3, [r0, #3664]
	.loc 1 170 0
	str	r3, [r0, #3668]
	.loc 1 171 0
	str	r3, [r0, #3672]
	.loc 1 190 0
	str	r3, [r0, #3748]
	.loc 1 191 0
	str	r3, [r0, #3752]
	.loc 1 192 0
	str	r3, [r0, #3756]
	.loc 1 193 0
	str	r3, [r0, #3760]
	.loc 1 194 0
	str	r3, [r0, #3764]
	.loc 1 195 0
	str	r3, [r0, #3768]
	.loc 1 196 0
	str	r3, [r0, #3772]
	.loc 1 197 0
	str	r3, [r0, #3776]
	.loc 1 198 0
	str	r3, [r0, #3780]
	.loc 1 199 0
	str	r3, [r0, #3784]
	.loc 1 200 0
	str	r3, [r0, #3788]
	.loc 1 201 0
	str	r3, [r0, #3792]
	.loc 1 202 0
	str	r3, [r0, #3796]
	.loc 1 203 0
	str	r3, [r0, #3800]
	.loc 1 204 0
	str	r3, [r0, #3804]
	.loc 1 205 0
	str	r3, [r0, #3808]
	.loc 1 206 0
	str	r3, [r0, #3812]
	.loc 1 207 0
	str	r3, [r0, #3816]
	.loc 1 208 0
	str	r3, [r0, #3820]
	.loc 1 209 0
	str	r3, [r0, #3824]
	.loc 1 210 0
	str	r3, [r0, #3828]
	.loc 1 211 0
	str	r3, [r0, #3832]
	.loc 1 212 0
	str	r3, [r0, #3836]
	.loc 1 213 0
	str	r3, [r0, #3840]
	.loc 1 214 0
	str	r3, [r0, #4]
	.loc 1 215 0
	str	r3, [r0, #8]
	.loc 1 216 0
	str	r3, [r0, #12]
	.loc 1 217 0
	str	r3, [r0, #16]
	.loc 1 218 0
	str	r3, [r0, #20]
	.loc 1 219 0
	str	r3, [r0, #24]
	.loc 1 220 0
	str	r3, [r0, #28]
	.loc 1 221 0
	str	r3, [r0, #32]
	.loc 1 222 0
	str	r3, [r0, #36]
	.loc 1 223 0
	str	r3, [r0, #40]
	.loc 1 224 0
	str	r3, [r0, #44]
	.loc 1 225 0
	str	r3, [r0, #48]
	.loc 1 229 0
	str	r3, [r0, #64]
	.loc 1 230 0
	str	r3, [r0, #68]
	.loc 1 231 0
	str	r3, [r0, #72]
	.loc 1 232 0
	str	r3, [r0, #76]
	.loc 1 233 0
	str	r3, [r0, #80]
	.loc 1 234 0
	str	r3, [r0, #84]
	.loc 1 235 0
	str	r3, [r0, #88]
	.loc 1 236 0
	str	r3, [r0, #92]
	.loc 1 237 0
	str	r3, [r0, #96]
	.loc 1 238 0
	str	r3, [r0, #100]
	.loc 1 239 0
	str	r3, [r0, #104]
	.loc 1 240 0
	str	r3, [r0, #108]
	.loc 1 241 0
	str	r3, [r0, #112]
	.loc 1 242 0
	str	r3, [r0, #116]
	.loc 1 243 0
	str	r3, [r0, #120]
	.loc 1 256 0
	str	r3, [r0, #172]
	.loc 1 257 0
	str	r3, [r0, #176]
	.loc 1 258 0
	str	r3, [r0, #180]
	.loc 1 262 0
	str	r3, [r0, #196]
	.loc 1 263 0
	str	r3, [r0, #200]
	.loc 1 264 0
	str	r3, [r0, #204]
	.loc 1 265 0
	str	r3, [r0, #208]
	.loc 1 266 0
	str	r3, [r0, #212]
	.loc 1 267 0
	str	r3, [r0, #216]
	.loc 1 268 0
	str	r3, [r0, #220]
	.loc 1 269 0
	str	r3, [r0, #224]
	.loc 1 270 0
	str	r3, [r0, #228]
	.loc 1 271 0
	str	r3, [r0, #232]
	.loc 1 272 0
	str	r3, [r0, #236]
	.loc 1 273 0
	str	r3, [r0, #240]
	.loc 1 274 0
	str	r3, [r0, #244]
	.loc 1 275 0
	str	r3, [r0, #248]
	.loc 1 276 0
	str	r3, [r0, #252]
	.loc 1 277 0
	str	r3, [r0, #256]
	.loc 1 278 0
	str	r3, [r0, #260]
	.loc 1 279 0
	str	r3, [r0, #264]
	.loc 1 280 0
	str	r3, [r0, #268]
	.loc 1 281 0
	str	r3, [r0, #272]
	.loc 1 282 0
	str	r3, [r0, #276]
	.loc 1 283 0
	str	r3, [r0, #280]
	.loc 1 284 0
	str	r3, [r0, #284]
	.loc 1 285 0
	str	r3, [r0, #288]
	.loc 1 286 0
	str	r3, [r0, #292]
	.loc 1 287 0
	str	r3, [r0, #296]
	.loc 1 288 0
	str	r3, [r0, #300]
	.loc 1 289 0
	str	r3, [r0, #304]
	.loc 1 290 0
	str	r3, [r0, #308]
	.loc 1 291 0
	str	r3, [r0, #312]
	.loc 1 292 0
	str	r3, [r0, #316]
	.loc 1 293 0
	str	r3, [r0, #320]
	.loc 1 294 0
	str	r3, [r0, #324]
	.loc 1 295 0
	str	r3, [r0, #328]
	.loc 1 296 0
	str	r3, [r0, #332]
	.loc 1 297 0
	str	r3, [r0, #336]
	.loc 1 298 0
	str	r3, [r0, #340]
	.loc 1 299 0
	str	r3, [r0, #344]
	.loc 1 300 0
	str	r3, [r0, #348]
	.loc 1 301 0
	str	r3, [r0, #352]
	.loc 1 302 0
	str	r3, [r0, #356]
	.loc 1 303 0
	str	r3, [r0, #360]
	.loc 1 304 0
	str	r3, [r0, #364]
	.loc 1 305 0
	str	r3, [r0, #368]
	.loc 1 306 0
	str	r3, [r0, #372]
	.loc 1 307 0
	str	r3, [r0, #376]
	.loc 1 308 0
	str	r3, [r0, #380]
	.loc 1 309 0
	str	r3, [r0, #384]
	.loc 1 310 0
	str	r3, [r0, #388]
	.loc 1 311 0
	str	r3, [r0, #392]
	.loc 1 312 0
	str	r3, [r0, #396]
	.loc 1 313 0
	str	r3, [r0, #400]
	.loc 1 314 0
	str	r3, [r0, #404]
	.loc 1 315 0
	str	r3, [r0, #408]
	.loc 1 316 0
	str	r3, [r0, #412]
	.loc 1 317 0
	str	r3, [r0, #416]
	.loc 1 318 0
	str	r3, [r0, #420]
	.loc 1 319 0
	str	r3, [r0, #424]
	.loc 1 320 0
	str	r3, [r0, #428]
	.loc 1 321 0
	str	r3, [r0, #432]
	.loc 1 322 0
	str	r3, [r0, #436]
	.loc 1 323 0
	str	r3, [r0, #440]
	.loc 1 324 0
	str	r3, [r0, #444]
	.loc 1 325 0
	str	r3, [r0, #448]
	.loc 1 326 0
	str	r3, [r0, #452]
	.loc 1 327 0
	str	r3, [r0, #456]
	.loc 1 328 0
	str	r3, [r0, #460]
	.loc 1 329 0
	str	r3, [r0, #464]
	.loc 1 330 0
	str	r3, [r0, #468]
	.loc 1 331 0
	str	r3, [r0, #472]
	.loc 1 332 0
	str	r3, [r0, #476]
	.loc 1 333 0
	str	r3, [r0, #480]
	.loc 1 334 0
	str	r3, [r0, #484]
	.loc 1 335 0
	str	r3, [r0, #488]
	.loc 1 336 0
	str	r3, [r0, #492]
	.loc 1 337 0
	str	r3, [r0, #496]
	.loc 1 338 0
	str	r3, [r0, #500]
	.loc 1 339 0
	str	r3, [r0, #504]
	.loc 1 340 0
	str	r3, [r0, #508]
	.loc 1 341 0
	str	r3, [r0, #512]
	.loc 1 342 0
	str	r3, [r0, #516]
	.loc 1 343 0
	str	r3, [r0, #520]
	.loc 1 344 0
	str	r3, [r0, #524]
	.loc 1 345 0
	str	r3, [r0, #528]
	.loc 1 346 0
	str	r3, [r0, #532]
	.loc 1 347 0
	str	r3, [r0, #536]
	.loc 1 348 0
	str	r3, [r0, #540]
	.loc 1 349 0
	str	r3, [r0, #544]
	.loc 1 350 0
	str	r3, [r0, #548]
	.loc 1 351 0
	str	r3, [r0, #552]
	.loc 1 352 0
	str	r3, [r0, #556]
	.loc 1 353 0
	str	r3, [r0, #560]
	.loc 1 354 0
	str	r3, [r0, #564]
	.loc 1 355 0
	str	r3, [r0, #568]
	.loc 1 356 0
	str	r3, [r0, #572]
	.loc 1 357 0
	str	r3, [r0, #576]
	.loc 1 358 0
	str	r3, [r0, #580]
	.loc 1 359 0
	str	r3, [r0, #584]
	.loc 1 360 0
	str	r3, [r0, #588]
	.loc 1 361 0
	str	r3, [r0, #592]
	.loc 1 362 0
	str	r3, [r0, #596]
	.loc 1 363 0
	str	r3, [r0, #600]
	.loc 1 364 0
	str	r3, [r0, #604]
	.loc 1 365 0
	str	r3, [r0, #608]
	.loc 1 366 0
	str	r3, [r0, #612]
	.loc 1 367 0
	str	r3, [r0, #616]
	.loc 1 368 0
	str	r3, [r0, #620]
	.loc 1 369 0
	str	r3, [r0, #624]
	.loc 1 370 0
	str	r3, [r0, #628]
	.loc 1 371 0
	str	r3, [r0, #632]
	.loc 1 372 0
	str	r3, [r0, #636]
	.loc 1 373 0
	str	r3, [r0, #640]
	.loc 1 374 0
	str	r3, [r0, #644]
	.loc 1 375 0
	str	r3, [r0, #648]
	.loc 1 376 0
	str	r3, [r0, #652]
	.loc 1 377 0
	str	r3, [r0, #656]
	.loc 1 378 0
	str	r3, [r0, #660]
	.loc 1 379 0
	str	r3, [r0, #664]
	.loc 1 380 0
	str	r3, [r0, #668]
	.loc 1 381 0
	str	r3, [r0, #672]
	.loc 1 382 0
	str	r3, [r0, #676]
	.loc 1 383 0
	str	r3, [r0, #680]
	.loc 1 384 0
	str	r3, [r0, #684]
	.loc 1 385 0
	str	r3, [r0, #688]
	.loc 1 386 0
	str	r3, [r0, #692]
	.loc 1 387 0
	str	r3, [r0, #696]
	.loc 1 388 0
	str	r3, [r0, #700]
	.loc 1 389 0
	str	r3, [r0, #704]
	.loc 1 390 0
	str	r3, [r0, #708]
	.loc 1 391 0
	str	r3, [r0, #712]
	.loc 1 392 0
	str	r3, [r0, #716]
	.loc 1 393 0
	str	r3, [r0, #720]
	.loc 1 394 0
	str	r3, [r0, #724]
	.loc 1 395 0
	str	r3, [r0, #728]
	.loc 1 396 0
	str	r3, [r0, #732]
	.loc 1 397 0
	str	r3, [r0, #736]
	.loc 1 398 0
	str	r3, [r0, #740]
	.loc 1 399 0
	str	r3, [r0, #744]
	.loc 1 400 0
	str	r3, [r0, #748]
	.loc 1 401 0
	str	r3, [r0, #752]
	.loc 1 402 0
	str	r3, [r0, #756]
	.loc 1 403 0
	str	r3, [r0, #760]
	.loc 1 404 0
	str	r3, [r0, #764]
	.loc 1 405 0
	str	r3, [r0, #768]
	.loc 1 406 0
	str	r3, [r0, #772]
	.loc 1 407 0
	str	r3, [r0, #776]
	.loc 1 408 0
	str	r3, [r0, #780]
	.loc 1 409 0
	str	r3, [r0, #784]
	.loc 1 410 0
	str	r3, [r0, #788]
	.loc 1 411 0
	str	r3, [r0, #792]
	.loc 1 412 0
	str	r3, [r0, #796]
	.loc 1 413 0
	str	r3, [r0, #800]
	.loc 1 414 0
	str	r3, [r0, #804]
	.loc 1 415 0
	str	r3, [r0, #808]
	.loc 1 416 0
	str	r3, [r0, #812]
	.loc 1 417 0
	str	r3, [r0, #816]
	.loc 1 418 0
	str	r3, [r0, #820]
	.loc 1 419 0
	str	r3, [r0, #824]
	.loc 1 420 0
	str	r3, [r0, #828]
	.loc 1 421 0
	str	r3, [r0, #832]
	.loc 1 422 0
	str	r3, [r0, #836]
	.loc 1 423 0
	str	r3, [r0, #840]
	.loc 1 424 0
	str	r3, [r0, #844]
	.loc 1 425 0
	str	r3, [r0, #848]
	.loc 1 426 0
	str	r3, [r0, #852]
	.loc 1 427 0
	str	r3, [r0, #856]
	.loc 1 428 0
	str	r3, [r0, #860]
	.loc 1 429 0
	str	r3, [r0, #864]
	.loc 1 430 0
	str	r3, [r0, #868]
	.loc 1 431 0
	str	r3, [r0, #872]
	.loc 1 432 0
	str	r3, [r0, #876]
	.loc 1 433 0
	str	r3, [r0, #880]
	.loc 1 434 0
	str	r3, [r0, #884]
	.loc 1 435 0
	str	r3, [r0, #888]
	.loc 1 436 0
	str	r3, [r0, #892]
	.loc 1 437 0
	str	r3, [r0, #896]
	.loc 1 438 0
	str	r3, [r0, #900]
	.loc 1 439 0
	str	r3, [r0, #904]
	.loc 1 440 0
	str	r3, [r0, #908]
	.loc 1 441 0
	str	r3, [r0, #912]
	.loc 1 442 0
	str	r3, [r0, #916]
	.loc 1 443 0
	str	r3, [r0, #920]
	.loc 1 444 0
	str	r3, [r0, #924]
	.loc 1 445 0
	str	r3, [r0, #928]
	.loc 1 446 0
	str	r3, [r0, #932]
	.loc 1 447 0
	str	r3, [r0, #936]
	.loc 1 448 0
	str	r3, [r0, #940]
	.loc 1 449 0
	str	r3, [r0, #944]
	.loc 1 450 0
	str	r3, [r0, #948]
	.loc 1 451 0
	str	r3, [r0, #952]
	.loc 1 452 0
	str	r3, [r0, #956]
	.loc 1 453 0
	str	r3, [r0, #960]
	.loc 1 454 0
	str	r3, [r0, #964]
	.loc 1 455 0
	str	r3, [r0, #968]
	.loc 1 456 0
	str	r3, [r0, #972]
	.loc 1 457 0
	str	r3, [r0, #976]
	.loc 1 458 0
	str	r3, [r0, #980]
	.loc 1 459 0
	str	r3, [r0, #984]
	.loc 1 460 0
	str	r3, [r0, #988]
	.loc 1 461 0
	str	r3, [r0, #992]
	.loc 1 462 0
	str	r3, [r0, #996]
	.loc 1 463 0
	str	r3, [r0, #1000]
	.loc 1 464 0
	str	r3, [r0, #1004]
	.loc 1 465 0
	str	r3, [r0, #1008]
	.loc 1 466 0
	str	r3, [r0, #1012]
	.loc 1 467 0
	str	r3, [r0, #1016]
	.loc 1 468 0
	str	r3, [r0, #1020]
	.loc 1 469 0
	str	r3, [r0, #1024]
	.loc 1 470 0
	str	r3, [r0, #1028]
	.loc 1 471 0
	str	r3, [r0, #1032]
	.loc 1 472 0
	str	r3, [r0, #1036]
	.loc 1 473 0
	str	r3, [r0, #1040]
	.loc 1 474 0
	str	r3, [r0, #1044]
	.loc 1 475 0
	str	r3, [r0, #1048]
	.loc 1 476 0
	str	r3, [r0, #1052]
	.loc 1 477 0
	str	r3, [r0, #1056]
	.loc 1 478 0
	str	r3, [r0, #1060]
	.loc 1 479 0
	str	r3, [r0, #1064]
	.loc 1 480 0
	str	r3, [r0, #1068]
	.loc 1 481 0
	str	r3, [r0, #1072]
	.loc 1 482 0
	str	r3, [r0, #1076]
	.loc 1 483 0
	str	r3, [r0, #1080]
	.loc 1 484 0
	str	r3, [r0, #1084]
	.loc 1 485 0
	str	r3, [r0, #1088]
	.loc 1 486 0
	str	r3, [r0, #1092]
	.loc 1 487 0
	str	r3, [r0, #1096]
	.loc 1 488 0
	str	r3, [r0, #1100]
	.loc 1 489 0
	str	r3, [r0, #1104]
	.loc 1 490 0
	str	r3, [r0, #1108]
	.loc 1 491 0
	str	r3, [r0, #1112]
	.loc 1 492 0
	str	r3, [r0, #1116]
	.loc 1 493 0
	str	r3, [r0, #1120]
	.loc 1 494 0
	str	r3, [r0, #1124]
	.loc 1 495 0
	str	r3, [r0, #1128]
	.loc 1 496 0
	str	r3, [r0, #1132]
	.loc 1 497 0
	str	r3, [r0, #1136]
	.loc 1 498 0
	str	r3, [r0, #1140]
	.loc 1 499 0
	str	r3, [r0, #1144]
	.loc 1 500 0
	str	r3, [r0, #1148]
	.loc 1 501 0
	str	r3, [r0, #1152]
	.loc 1 502 0
	str	r3, [r0, #1156]
	.loc 1 503 0
	str	r3, [r0, #1160]
	.loc 1 504 0
	str	r3, [r0, #1164]
	.loc 1 505 0
	str	r3, [r0, #1168]
	.loc 1 506 0
	str	r3, [r0, #1172]
	.loc 1 507 0
	str	r3, [r0, #1176]
	.loc 1 508 0
	str	r3, [r0, #1180]
	.loc 1 509 0
	str	r3, [r0, #1184]
	.loc 1 510 0
	str	r3, [r0, #1188]
	.loc 1 511 0
	str	r3, [r0, #1192]
	.loc 1 512 0
	str	r3, [r0, #1196]
	.loc 1 513 0
	str	r3, [r0, #1200]
	.loc 1 514 0
	str	r3, [r0, #1204]
	.loc 1 515 0
	str	r3, [r0, #1208]
	.loc 1 516 0
	str	r3, [r0, #1212]
	.loc 1 517 0
	str	r3, [r0, #1216]
	.loc 1 518 0
	str	r3, [r0, #1220]
	.loc 1 519 0
	str	r3, [r0, #1224]
	.loc 1 520 0
	str	r3, [r0, #1228]
	.loc 1 521 0
	str	r3, [r0, #1232]
	.loc 1 522 0
	str	r3, [r0, #1236]
	.loc 1 523 0
	str	r3, [r0, #1240]
	.loc 1 524 0
	str	r3, [r0, #1244]
	.loc 1 525 0
	str	r3, [r0, #1248]
	.loc 1 526 0
	str	r3, [r0, #1252]
	.loc 1 527 0
	str	r3, [r0, #1256]
	.loc 1 528 0
	str	r3, [r0, #1260]
	.loc 1 529 0
	str	r3, [r0, #1264]
	.loc 1 530 0
	str	r3, [r0, #1268]
	.loc 1 531 0
	str	r3, [r0, #1272]
	.loc 1 532 0
	str	r3, [r0, #1276]
	.loc 1 533 0
	str	r3, [r0, #1280]
	.loc 1 534 0
	str	r3, [r0, #1284]
	.loc 1 535 0
	str	r3, [r0, #1288]
	.loc 1 536 0
	str	r3, [r0, #1292]
	.loc 1 537 0
	str	r3, [r0, #1296]
	.loc 1 538 0
	str	r3, [r0, #1300]
	.loc 1 539 0
	str	r3, [r0, #1304]
	.loc 1 540 0
	str	r3, [r0, #1308]
	.loc 1 541 0
	str	r3, [r0, #1312]
	.loc 1 542 0
	str	r3, [r0, #1316]
	.loc 1 543 0
	str	r3, [r0, #1320]
	.loc 1 544 0
	str	r3, [r0, #1324]
	.loc 1 545 0
	str	r3, [r0, #1328]
	.loc 1 546 0
	str	r3, [r0, #1332]
	.loc 1 547 0
	str	r3, [r0, #1336]
	.loc 1 548 0
	str	r3, [r0, #1340]
	.loc 1 549 0
	str	r3, [r0, #1344]
	.loc 1 550 0
	str	r3, [r0, #1348]
	.loc 1 551 0
	str	r3, [r0, #1352]
	.loc 1 552 0
	str	r3, [r0, #1356]
	.loc 1 553 0
	str	r3, [r0, #1360]
	.loc 1 554 0
	str	r3, [r0, #1364]
	.loc 1 555 0
	str	r3, [r0, #1368]
	.loc 1 556 0
	str	r3, [r0, #1372]
	.loc 1 557 0
	str	r3, [r0, #1376]
	.loc 1 558 0
	str	r3, [r0, #1380]
	.loc 1 559 0
	str	r3, [r0, #1384]
	.loc 1 560 0
	str	r3, [r0, #1388]
	.loc 1 561 0
	str	r3, [r0, #1392]
	.loc 1 562 0
	str	r3, [r0, #1396]
	.loc 1 563 0
	str	r3, [r0, #1400]
	.loc 1 564 0
	str	r3, [r0, #1404]
	.loc 1 565 0
	str	r3, [r0, #1408]
	.loc 1 566 0
	str	r3, [r0, #1412]
	.loc 1 567 0
	str	r3, [r0, #1416]
	.loc 1 568 0
	str	r3, [r0, #1420]
	.loc 1 569 0
	str	r3, [r0, #1424]
	.loc 1 570 0
	str	r3, [r0, #1428]
	.loc 1 571 0
	str	r3, [r0, #1432]
	.loc 1 572 0
	str	r3, [r0, #1436]
	.loc 1 573 0
	str	r3, [r0, #1440]
	.loc 1 574 0
	str	r3, [r0, #1444]
	.loc 1 575 0
	str	r3, [r0, #1448]
	.loc 1 576 0
	str	r3, [r0, #1452]
	.loc 1 577 0
	str	r3, [r0, #1456]
	.loc 1 578 0
	str	r3, [r0, #1460]
	.loc 1 579 0
	str	r3, [r0, #1464]
	.loc 1 580 0
	str	r3, [r0, #1468]
	.loc 1 581 0
	str	r3, [r0, #1472]
	.loc 1 582 0
	str	r3, [r0, #1476]
	.loc 1 583 0
	str	r3, [r0, #1480]
	.loc 1 584 0
	str	r3, [r0, #1484]
	.loc 1 585 0
	str	r3, [r0, #1488]
	.loc 1 586 0
	str	r3, [r0, #1492]
	.loc 1 587 0
	str	r3, [r0, #1496]
	.loc 1 588 0
	str	r3, [r0, #1500]
	.loc 1 589 0
	str	r3, [r0, #1504]
	.loc 1 590 0
	str	r3, [r0, #1508]
	.loc 1 591 0
	str	r3, [r0, #1512]
	.loc 1 592 0
	str	r3, [r0, #1516]
	.loc 1 593 0
	str	r3, [r0, #1520]
	.loc 1 594 0
	str	r3, [r0, #1524]
	.loc 1 595 0
	str	r3, [r0, #1528]
	.loc 1 596 0
	str	r3, [r0, #1532]
	.loc 1 597 0
	str	r3, [r0, #1536]
	.loc 1 598 0
	str	r3, [r0, #1540]
	.loc 1 599 0
	str	r3, [r0, #1544]
	.loc 1 600 0
	str	r3, [r0, #1548]
	.loc 1 601 0
	str	r3, [r0, #1552]
	.loc 1 602 0
	str	r3, [r0, #1556]
	.loc 1 603 0
	str	r3, [r0, #1560]
	.loc 1 604 0
	str	r3, [r0, #1564]
	.loc 1 605 0
	str	r3, [r0, #1568]
	.loc 1 606 0
	str	r3, [r0, #1572]
	.loc 1 607 0
	str	r3, [r0, #1576]
	.loc 1 608 0
	str	r3, [r0, #1580]
	.loc 1 609 0
	str	r3, [r0, #1584]
	.loc 1 610 0
	str	r3, [r0, #1588]
	.loc 1 611 0
	str	r3, [r0, #1592]
	.loc 1 612 0
	str	r3, [r0, #1596]
	.loc 1 613 0
	str	r3, [r0, #1600]
	.loc 1 614 0
	str	r3, [r0, #1604]
	.loc 1 615 0
	str	r3, [r0, #1608]
	.loc 1 616 0
	str	r3, [r0, #1612]
	.loc 1 617 0
	str	r3, [r0, #1616]
	.loc 1 618 0
	str	r3, [r0, #1620]
	.loc 1 619 0
	str	r3, [r0, #1624]
	.loc 1 620 0
	str	r3, [r0, #1628]
	.loc 1 621 0
	str	r3, [r0, #1632]
	.loc 1 622 0
	str	r3, [r0, #1636]
	.loc 1 623 0
	str	r3, [r0, #1640]
	.loc 1 624 0
	str	r3, [r0, #1644]
	.loc 1 625 0
	str	r3, [r0, #1648]
	.loc 1 626 0
	str	r3, [r0, #1652]
	.loc 1 627 0
	str	r3, [r0, #1656]
	.loc 1 628 0
	str	r3, [r0, #1660]
	.loc 1 629 0
	str	r3, [r0, #1664]
	.loc 1 630 0
	str	r3, [r0, #1668]
	.loc 1 631 0
	str	r3, [r0, #1672]
	.loc 1 632 0
	str	r3, [r0, #1676]
	.loc 1 633 0
	str	r3, [r0, #1680]
	.loc 1 634 0
	str	r3, [r0, #1684]
	.loc 1 635 0
	str	r3, [r0, #1688]
	.loc 1 636 0
	str	r3, [r0, #1692]
	.loc 1 637 0
	str	r3, [r0, #1696]
	.loc 1 638 0
	str	r3, [r0, #1700]
	.loc 1 639 0
	str	r3, [r0, #1704]
	.loc 1 640 0
	str	r3, [r0, #1708]
	.loc 1 641 0
	str	r3, [r0, #1712]
	.loc 1 642 0
	str	r3, [r0, #1716]
	.loc 1 643 0
	str	r3, [r0, #1720]
	.loc 1 644 0
	str	r3, [r0, #1724]
	.loc 1 645 0
	str	r3, [r0, #1728]
	.loc 1 646 0
	str	r3, [r0, #1732]
	.loc 1 647 0
	str	r3, [r0, #1736]
	.loc 1 648 0
	str	r3, [r0, #1740]
	.loc 1 649 0
	str	r3, [r0, #1744]
	.loc 1 650 0
	str	r3, [r0, #1748]
	.loc 1 651 0
	str	r3, [r0, #1752]
	.loc 1 652 0
	str	r3, [r0, #1756]
	.loc 1 653 0
	str	r3, [r0, #1760]
	.loc 1 654 0
	str	r3, [r0, #1764]
	.loc 1 655 0
	str	r3, [r0, #1768]
	.loc 1 656 0
	str	r3, [r0, #1772]
	.loc 1 657 0
	str	r3, [r0, #1776]
	.loc 1 658 0
	str	r3, [r0, #1780]
	.loc 1 659 0
	str	r3, [r0, #1784]
	.loc 1 660 0
	str	r3, [r0, #1788]
	.loc 1 661 0
	str	r3, [r0, #1792]
	.loc 1 662 0
	str	r3, [r0, #1796]
	.loc 1 663 0
	str	r3, [r0, #1800]
	.loc 1 664 0
	str	r3, [r0, #1804]
	.loc 1 665 0
	str	r3, [r0, #1808]
	.loc 1 666 0
	str	r3, [r0, #1812]
	.loc 1 667 0
	str	r3, [r0, #1816]
	.loc 1 668 0
	str	r3, [r0, #1820]
	.loc 1 669 0
	str	r3, [r0, #1824]
	.loc 1 670 0
	str	r3, [r0, #1828]
	.loc 1 671 0
	str	r3, [r0, #1832]
	.loc 1 672 0
	str	r3, [r0, #1836]
	.loc 1 673 0
	str	r3, [r0, #1840]
	.loc 1 674 0
	str	r3, [r0, #1844]
	.loc 1 675 0
	str	r3, [r0, #1848]
	.loc 1 676 0
	str	r3, [r0, #1852]
	.loc 1 677 0
	str	r3, [r0, #1856]
	.loc 1 678 0
	str	r3, [r0, #1860]
	.loc 1 679 0
	str	r3, [r0, #1864]
	.loc 1 680 0
	str	r3, [r0, #1868]
	.loc 1 681 0
	str	r3, [r0, #1872]
	.loc 1 682 0
	str	r3, [r0, #1876]
	.loc 1 683 0
	str	r3, [r0, #1880]
	.loc 1 684 0
	str	r3, [r0, #1884]
	.loc 1 685 0
	str	r3, [r0, #1888]
	.loc 1 686 0
	str	r3, [r0, #1892]
	.loc 1 687 0
	str	r3, [r0, #1896]
	.loc 1 688 0
	str	r3, [r0, #1900]
	.loc 1 689 0
	str	r3, [r0, #1904]
	.loc 1 690 0
	str	r3, [r0, #1908]
	.loc 1 691 0
	str	r3, [r0, #1912]
	.loc 1 692 0
	str	r3, [r0, #1916]
	.loc 1 693 0
	str	r3, [r0, #1920]
	.loc 1 694 0
	str	r3, [r0, #1924]
	.loc 1 695 0
	str	r3, [r0, #1928]
	.loc 1 696 0
	str	r3, [r0, #1932]
	.loc 1 697 0
	str	r3, [r0, #1936]
	.loc 1 698 0
	str	r3, [r0, #1940]
	.loc 1 699 0
	str	r3, [r0, #1944]
	.loc 1 700 0
	str	r3, [r0, #1948]
	.loc 1 701 0
	str	r3, [r0, #1952]
	.loc 1 702 0
	str	r3, [r0, #1956]
	.loc 1 703 0
	str	r3, [r0, #1960]
	.loc 1 704 0
	str	r3, [r0, #1964]
	.loc 1 705 0
	str	r3, [r0, #1968]
	.loc 1 706 0
	str	r3, [r0, #1972]
	.loc 1 707 0
	str	r3, [r0, #1976]
	.loc 1 708 0
	str	r3, [r0, #1980]
	.loc 1 709 0
	str	r3, [r0, #1984]
	.loc 1 710 0
	str	r3, [r0, #1988]
	.loc 1 711 0
	str	r3, [r0, #1992]
	.loc 1 712 0
	str	r3, [r0, #1996]
	.loc 1 713 0
	str	r3, [r0, #2000]
	.loc 1 714 0
	str	r3, [r0, #2004]
	.loc 1 715 0
	str	r3, [r0, #2008]
	.loc 1 716 0
	str	r3, [r0, #2012]
	.loc 1 717 0
	str	r3, [r0, #2016]
	.loc 1 718 0
	str	r3, [r0, #2020]
	.loc 1 719 0
	str	r3, [r0, #2024]
	.loc 1 720 0
	str	r3, [r0, #2028]
	.loc 1 721 0
	str	r3, [r0, #2032]
	.loc 1 722 0
	str	r3, [r0, #2036]
	.loc 1 723 0
	str	r3, [r0, #2040]
	.loc 1 724 0
	str	r3, [r0, #2044]
	.loc 1 725 0
	str	r3, [r0, #2048]
	.loc 1 726 0
	str	r3, [r0, #2052]
	.loc 1 727 0
	str	r3, [r0, #2056]
	.loc 1 728 0
	str	r3, [r0, #2060]
	.loc 1 729 0
	str	r3, [r0, #2064]
	.loc 1 730 0
	str	r3, [r0, #2068]
	.loc 1 731 0
	str	r3, [r0, #2072]
	.loc 1 732 0
	str	r3, [r0, #2076]
	.loc 1 733 0
	str	r3, [r0, #2080]
	.loc 1 734 0
	str	r3, [r0, #2084]
	.loc 1 735 0
	str	r3, [r0, #2088]
	.loc 1 736 0
	str	r3, [r0, #2092]
	.loc 1 737 0
	str	r3, [r0, #2096]
	.loc 1 738 0
	str	r3, [r0, #2100]
	.loc 1 739 0
	str	r3, [r0, #2104]
	.loc 1 740 0
	str	r3, [r0, #2108]
	.loc 1 741 0
	str	r3, [r0, #2112]
	.loc 1 742 0
	str	r3, [r0, #2116]
	.loc 1 743 0
	str	r3, [r0, #2120]
	.loc 1 744 0
	str	r3, [r0, #2124]
	.loc 1 745 0
	str	r3, [r0, #2128]
	.loc 1 746 0
	str	r3, [r0, #2132]
	.loc 1 747 0
	str	r3, [r0, #2136]
	.loc 1 748 0
	str	r3, [r0, #2140]
	.loc 1 749 0
	str	r3, [r0, #2144]
	.loc 1 750 0
	str	r3, [r0, #2148]
	.loc 1 751 0
	str	r3, [r0, #2152]
	.loc 1 752 0
	str	r3, [r0, #2156]
	.loc 1 753 0
	str	r3, [r0, #2160]
	.loc 1 754 0
	str	r3, [r0, #2164]
	.loc 1 755 0
	str	r3, [r0, #2168]
	.loc 1 756 0
	str	r3, [r0, #2172]
	.loc 1 757 0
	str	r3, [r0, #2176]
	.loc 1 758 0
	str	r3, [r0, #2180]
	.loc 1 759 0
	str	r3, [r0, #2184]
	.loc 1 760 0
	str	r3, [r0, #2188]
	.loc 1 761 0
	str	r3, [r0, #2192]
	.loc 1 762 0
	str	r3, [r0, #2196]
	.loc 1 763 0
	str	r3, [r0, #2200]
	.loc 1 764 0
	str	r3, [r0, #2204]
	.loc 1 765 0
	str	r3, [r0, #2208]
	.loc 1 766 0
	str	r3, [r0, #2212]
	.loc 1 767 0
	str	r3, [r0, #2216]
	.loc 1 768 0
	str	r3, [r0, #2220]
	.loc 1 769 0
	str	r3, [r0, #2224]
	.loc 1 770 0
	str	r3, [r0, #2228]
	.loc 1 771 0
	str	r3, [r0, #2232]
	.loc 1 772 0
	str	r3, [r0, #2236]
	.loc 1 773 0
	str	r3, [r0, #2240]
	.loc 1 774 0
	str	r3, [r0, #2244]
	.loc 1 775 0
	str	r3, [r0, #2248]
	.loc 1 776 0
	str	r3, [r0, #2252]
	.loc 1 777 0
	str	r3, [r0, #2256]
	.loc 1 778 0
	str	r3, [r0, #2260]
	.loc 1 779 0
	str	r3, [r0, #2264]
	.loc 1 780 0
	str	r3, [r0, #2268]
	.loc 1 781 0
	str	r3, [r0, #2272]
	.loc 1 782 0
	str	r3, [r0, #2276]
	.loc 1 783 0
	str	r3, [r0, #2280]
	.loc 1 784 0
	str	r3, [r0, #2284]
	.loc 1 785 0
	str	r3, [r0, #2288]
	.loc 1 786 0
	str	r3, [r0, #2292]
	.loc 1 787 0
	str	r3, [r0, #2296]
	.loc 1 788 0
	str	r3, [r0, #2300]
	.loc 1 789 0
	str	r3, [r0, #2304]
	.loc 1 790 0
	str	r3, [r0, #2308]
	.loc 1 791 0
	str	r3, [r0, #2312]
	.loc 1 792 0
	str	r3, [r0, #2316]
	.loc 1 793 0
	str	r3, [r0, #2320]
	.loc 1 794 0
	str	r3, [r0, #2324]
	.loc 1 795 0
	str	r3, [r0, #2328]
	.loc 1 796 0
	str	r3, [r0, #2332]
	.loc 1 797 0
	str	r3, [r0, #2336]
	.loc 1 798 0
	str	r3, [r0, #2340]
	.loc 1 799 0
	str	r3, [r0, #2344]
	.loc 1 800 0
	str	r3, [r0, #2348]
	.loc 1 801 0
	str	r3, [r0, #2352]
	.loc 1 802 0
	str	r3, [r0, #2356]
	.loc 1 803 0
	str	r3, [r0, #2360]
	.loc 1 804 0
	str	r3, [r0, #2364]
	.loc 1 805 0
	str	r3, [r0, #2368]
	.loc 1 806 0
	str	r3, [r0, #2372]
	.loc 1 807 0
	str	r3, [r0, #2376]
	.loc 1 808 0
	str	r3, [r0, #2380]
	.loc 1 809 0
	str	r3, [r0, #2384]
	.loc 1 810 0
	str	r3, [r0, #2388]
	.loc 1 811 0
	str	r3, [r0, #2392]
	.loc 1 812 0
	str	r3, [r0, #2396]
	.loc 1 813 0
	str	r3, [r0, #2400]
	.loc 1 814 0
	str	r3, [r0, #2404]
	.loc 1 815 0
	str	r3, [r0, #2408]
	.loc 1 816 0
	str	r3, [r0, #2412]
	.loc 1 817 0
	str	r3, [r0, #2416]
	.loc 1 818 0
	str	r3, [r0, #2420]
	.loc 1 819 0
	str	r3, [r0, #2424]
	.loc 1 820 0
	str	r3, [r0, #2428]
	.loc 1 821 0
	str	r3, [r0, #2432]
	.loc 1 822 0
	str	r3, [r0, #2436]
	.loc 1 823 0
	str	r3, [r0, #2440]
	.loc 1 824 0
	str	r3, [r0, #2444]
	.loc 1 825 0
	str	r3, [r0, #2448]
	.loc 1 826 0
	str	r3, [r0, #2452]
	.loc 1 827 0
	str	r3, [r0, #2456]
	.loc 1 828 0
	str	r3, [r0, #2460]
	.loc 1 829 0
	str	r3, [r0, #2464]
	.loc 1 830 0
	str	r3, [r0, #2468]
	.loc 1 831 0
	str	r3, [r0, #2472]
	.loc 1 832 0
	str	r3, [r0, #2476]
	.loc 1 833 0
	str	r3, [r0, #2480]
	.loc 1 834 0
	str	r3, [r0, #2484]
	.loc 1 835 0
	str	r3, [r0, #2488]
	.loc 1 836 0
	str	r3, [r0, #2492]
	.loc 1 837 0
	str	r3, [r0, #2496]
	.loc 1 838 0
	str	r3, [r0, #2500]
	.loc 1 839 0
	str	r3, [r0, #2504]
	.loc 1 840 0
	str	r3, [r0, #2508]
	.loc 1 841 0
	str	r3, [r0, #2512]
	.loc 1 842 0
	str	r3, [r0, #2516]
	.loc 1 843 0
	str	r3, [r0, #2520]
	.loc 1 844 0
	str	r3, [r0, #2524]
	.loc 1 845 0
	str	r3, [r0, #2528]
	.loc 1 846 0
	str	r3, [r0, #2532]
	.loc 1 847 0
	str	r3, [r0, #2536]
	.loc 1 848 0
	str	r3, [r0, #2540]
	.loc 1 849 0
	str	r3, [r0, #2544]
	.loc 1 850 0
	str	r3, [r0, #2548]
	.loc 1 851 0
	str	r3, [r0, #2552]
	.loc 1 852 0
	str	r3, [r0, #2556]
	.loc 1 853 0
	str	r3, [r0, #2560]
	.loc 1 854 0
	str	r3, [r0, #2564]
	.loc 1 855 0
	str	r3, [r0, #2568]
	.loc 1 856 0
	str	r3, [r0, #2572]
	.loc 1 857 0
	str	r3, [r0, #2576]
	.loc 1 858 0
	str	r3, [r0, #2580]
	.loc 1 859 0
	str	r3, [r0, #2584]
	.loc 1 860 0
	str	r3, [r0, #2588]
	.loc 1 861 0
	str	r3, [r0, #2592]
	.loc 1 862 0
	str	r3, [r0, #2596]
	.loc 1 863 0
	str	r3, [r0, #2600]
	.loc 1 864 0
	str	r3, [r0, #2604]
	.loc 1 865 0
	str	r3, [r0, #2608]
	.loc 1 866 0
	str	r3, [r0, #2612]
	.loc 1 867 0
	str	r3, [r0, #2616]
	.loc 1 868 0
	str	r3, [r0, #2620]
	.loc 1 869 0
	str	r3, [r0, #2624]
	.loc 1 870 0
	str	r3, [r0, #2628]
	.loc 1 871 0
	str	r3, [r0, #2632]
	.loc 1 872 0
	str	r3, [r0, #2636]
	.loc 1 873 0
	str	r3, [r0, #2640]
	.loc 1 874 0
	str	r3, [r0, #2644]
	.loc 1 875 0
	str	r3, [r0, #2648]
	.loc 1 876 0
	str	r3, [r0, #2652]
	.loc 1 877 0
	str	r3, [r0, #2656]
	.loc 1 878 0
	str	r3, [r0, #2660]
	.loc 1 879 0
	str	r3, [r0, #2664]
	.loc 1 880 0
	str	r3, [r0, #2668]
	.loc 1 881 0
	str	r3, [r0, #2672]
	.loc 1 882 0
	str	r3, [r0, #2676]
	.loc 1 883 0
	str	r3, [r0, #2680]
	.loc 1 884 0
	str	r3, [r0, #2684]
	.loc 1 885 0
	str	r3, [r0, #2688]
	.loc 1 886 0
	str	r3, [r0, #2692]
	.loc 1 887 0
	str	r3, [r0, #2696]
	.loc 1 888 0
	str	r3, [r0, #2700]
	.loc 1 889 0
	str	r3, [r0, #2704]
	.loc 1 890 0
	str	r3, [r0, #2708]
	.loc 1 891 0
	str	r3, [r0, #2712]
	.loc 1 892 0
	str	r3, [r0, #2716]
	.loc 1 893 0
	str	r3, [r0, #2720]
	.loc 1 894 0
	str	r3, [r0, #2724]
	.loc 1 895 0
	str	r3, [r0, #2728]
	.loc 1 896 0
	str	r3, [r0, #2732]
	.loc 1 897 0
	str	r3, [r0, #2736]
	.loc 1 898 0
	str	r3, [r0, #2740]
	.loc 1 899 0
	str	r3, [r0, #2744]
	.loc 1 900 0
	str	r3, [r0, #2748]
	.loc 1 901 0
	str	r3, [r0, #2752]
	.loc 1 902 0
	str	r3, [r0, #2756]
	.loc 1 903 0
	str	r3, [r0, #2760]
	.loc 1 904 0
	str	r3, [r0, #2764]
	.loc 1 905 0
	str	r3, [r0, #2768]
	.loc 1 906 0
	str	r3, [r0, #2772]
	.loc 1 907 0
	str	r3, [r0, #2776]
	.loc 1 908 0
	str	r3, [r0, #2780]
	.loc 1 909 0
	str	r3, [r0, #2784]
	.loc 1 910 0
	str	r3, [r0, #2788]
	.loc 1 911 0
	str	r3, [r0, #2792]
	.loc 1 912 0
	str	r3, [r0, #2796]
	.loc 1 913 0
	str	r3, [r0, #2800]
	.loc 1 914 0
	str	r3, [r0, #2804]
	.loc 1 915 0
	str	r3, [r0, #2808]
	.loc 1 916 0
	str	r3, [r0, #2812]
	.loc 1 917 0
	str	r3, [r0, #2816]
	.loc 1 918 0
	str	r3, [r0, #2820]
	.loc 1 919 0
	str	r3, [r0, #2824]
	.loc 1 920 0
	str	r3, [r0, #2828]
	.loc 1 921 0
	str	r3, [r0, #2832]
	.loc 1 922 0
	str	r3, [r0, #2836]
	.loc 1 923 0
	str	r3, [r0, #2840]
	.loc 1 924 0
	str	r3, [r0, #2844]
	.loc 1 925 0
	str	r3, [r0, #2848]
	.loc 1 926 0
	str	r3, [r0, #2852]
	.loc 1 927 0
	str	r3, [r0, #2856]
	.loc 1 928 0
	str	r3, [r0, #2860]
	.loc 1 929 0
	str	r3, [r0, #2864]
	.loc 1 930 0
	str	r3, [r0, #2868]
	.loc 1 931 0
	str	r3, [r0, #2872]
	.loc 1 932 0
	str	r3, [r0, #2876]
	.loc 1 933 0
	str	r3, [r0, #2880]
	.loc 1 934 0
	str	r3, [r0, #2884]
	.loc 1 935 0
	str	r3, [r0, #2888]
	.loc 1 936 0
	str	r3, [r0, #2892]
	.loc 1 937 0
	str	r3, [r0, #2896]
	.loc 1 938 0
	str	r3, [r0, #2900]
	.loc 1 939 0
	str	r3, [r0, #2904]
	.loc 1 940 0
	str	r3, [r0, #2908]
	.loc 1 941 0
	str	r3, [r0, #2912]
	.loc 1 942 0
	str	r3, [r0, #2916]
	.loc 1 943 0
	str	r3, [r0, #2920]
	.loc 1 944 0
	str	r3, [r0, #2924]
	.loc 1 945 0
	str	r3, [r0, #2928]
	.loc 1 946 0
	str	r3, [r0, #2932]
	.loc 1 947 0
	str	r3, [r0, #2936]
	.loc 1 948 0
	str	r3, [r0, #2940]
	.loc 1 949 0
	str	r3, [r0, #2944]
	.loc 1 950 0
	str	r3, [r0, #2948]
	.loc 1 951 0
	str	r3, [r0, #2952]
	.loc 1 952 0
	str	r3, [r0, #2956]
	.loc 1 953 0
	str	r3, [r0, #2960]
	.loc 1 954 0
	str	r3, [r0, #2964]
	.loc 1 955 0
	str	r3, [r0, #2968]
	.loc 1 956 0
	str	r3, [r0, #2972]
	.loc 1 957 0
	str	r3, [r0, #2976]
	.loc 1 958 0
	str	r3, [r0, #2980]
	.loc 1 959 0
	str	r3, [r0, #2984]
	.loc 1 960 0
	str	r3, [r0, #2988]
	.loc 1 961 0
	str	r3, [r0, #2992]
	.loc 1 962 0
	str	r3, [r0, #2996]
	.loc 1 963 0
	str	r3, [r0, #3000]
	.loc 1 964 0
	str	r3, [r0, #3004]
	.loc 1 965 0
	str	r3, [r0, #3008]
	.loc 1 966 0
	str	r3, [r0, #3012]
	.loc 1 967 0
	str	r3, [r0, #3016]
	.loc 1 968 0
	str	r3, [r0, #3020]
	.loc 1 969 0
	str	r3, [r0, #3024]
	.loc 1 970 0
	str	r3, [r0, #3028]
	.loc 1 971 0
	str	r3, [r0, #3032]
	.loc 1 972 0
	str	r3, [r0, #3036]
	.loc 1 973 0
	str	r3, [r0, #3040]
	.loc 1 974 0
	str	r3, [r0, #3044]
	.loc 1 975 0
	str	r3, [r0, #3048]
	.loc 1 976 0
	str	r3, [r0, #3052]
	.loc 1 977 0
	str	r3, [r0, #3056]
	.loc 1 978 0
	str	r3, [r0, #3060]
	.loc 1 979 0
	str	r3, [r0, #3064]
	.loc 1 980 0
	str	r3, [r0, #3068]
	.loc 1 992 0
	add	r3, r6, #5
	.loc 1 989 0
	str	r6, [r0, #3504]
	.loc 1 992 0
	str	r3, [r0, #72]
	.loc 1 995 0
	add	r3, r3, r6
	str	r3, [r0, #228]
	.loc 1 1003 0
	add	r3, r3, #5
	str	r3, [r0, #3552]
	.loc 1 1006 0
	add	r3, r3, #8
	str	r3, [r0, #48]
	.loc 1 1014 0
	add	r3, r3, #5
	str	r3, [r0, #3144]
	.loc 1 991 0
	add	r3, r6, #5
	str	r3, [r0, #68]
	.loc 1 994 0
	add	r3, r3, r6
	str	r3, [r0, #224]
	.loc 1 998 0
	add	r3, r3, #5
	str	r3, [r0, #3536]
	.loc 1 999 0
	str	r3, [r0, #3540]
	.loc 1 1002 0
	str	r3, [r0, #3548]
	.loc 1 1005 0
	add	r3, r3, #8
	str	r3, [r0, #44]
	.loc 1 1009 0
	add	r3, r3, #5
	str	r3, [r0, #3128]
	.loc 1 1010 0
	str	r3, [r0, #3132]
	.loc 1 1013 0
	str	r3, [r0, #3140]
	.loc 1 1017 0
	add	r3, r3, r6
	.loc 1 1072 0
	mov	lr, #4
	.loc 1 1017 0
	str	r3, [r0, #3368]
	.loc 1 1018 0
	str	r3, [r0, #3372]
	.loc 1 1021 0
	str	r3, [r0, #3380]
	.loc 1 1022 0
	str	r3, [r0, #3384]
	.loc 1 1030 0
	add	r3, r3, #54
	.loc 1 1020 0
	str	r2, [r0, #3376]
	.loc 1 981 0
	str	r2, [r0, #3072]
	.loc 1 983 0
	str	r2, [r0, #3484]
	.loc 1 987 0
	str	r2, [r0, #3496]
	.loc 1 990 0
	str	r2, [r0, #64]
	.loc 1 993 0
	str	r2, [r0, #220]
	.loc 1 997 0
	str	r2, [r0, #3532]
	.loc 1 1001 0
	str	r2, [r0, #3544]
	.loc 1 1004 0
	str	r2, [r0, #40]
	.loc 1 1008 0
	str	r2, [r0, #3124]
	.loc 1 1012 0
	str	r2, [r0, #3136]
	.loc 1 1016 0
	str	r2, [r0, #3364]
	.loc 1 984 0
	str	r6, [r0, #3488]
	.loc 1 985 0
	str	r6, [r0, #3492]
	.loc 1 988 0
	str	r6, [r0, #3500]
	.loc 1 1030 0
	str	r3, [r0, #3984]
	.loc 1 1033 0
	add	r3, r3, lr
	str	r3, [r0, #96]
	.loc 1 1043 0
	sub	r3, r3, #80
	str	r3, [r0, #3524]
	.loc 1 1044 0
	add	r3, r3, #98
	str	r3, [r0, #3528]
	.loc 1 1047 0
	add	r3, r3, #9
	str	r3, [r0, #36]
	.loc 1 1055 0
	add	r3, r3, #5
	str	r3, [r0, #3156]
	.loc 1 1063 0
	add	r3, r3, #8
	str	r3, [r0, #3408]
	.loc 1 1025 0
	sub	r3, r3, #142
	str	r3, [r0, #3968]
	.loc 1 1026 0
	add	r3, r3, #98
	str	r3, [r0, #3972]
	.loc 1 1029 0
	sub	r3, r3, #98
	.loc 1 1323 0
	mov	fp, #14
	.loc 1 1029 0
	str	r3, [r0, #3980]
	.loc 1 1032 0
	add	r3, r3, lr
	str	r3, [r0, #92]
	.loc 1 1035 0
	add	r3, r3, fp
	str	r3, [r0, #80]
	.loc 1 1039 0
	add	r3, r3, lr
	str	r3, [r0, #3512]
	.loc 1 1040 0
	add	r3, r3, #98
	str	r3, [r0, #3516]
	.loc 1 1046 0
	sub	r3, r3, #89
	str	r3, [r0, #32]
	.loc 1 1050 0
	add	r3, r3, #5
	str	r3, [r0, #3164]
	.loc 1 1051 0
	add	r3, r3, #98
	str	r3, [r0, #3168]
	.loc 1 1054 0
	sub	r3, r3, #98
	str	r3, [r0, #3152]
	.loc 1 1058 0
	add	r3, r3, #8
	str	r3, [r0, #3392]
	.loc 1 1059 0
	add	r3, r3, #98
	str	r3, [r0, #3396]
	.loc 1 1062 0
	sub	r3, r3, #98
	str	r3, [r0, #3404]
	.loc 1 1065 0
	sub	r3, r3, #50
	.loc 1 1024 0
	mov	r5, #2
	.loc 1 1036 0
	add	r2, r2, #125
	.loc 1 1065 0
	str	r3, [r0, #3760]
	.loc 1 1071 0
	add	r3, r3, #157
	.loc 1 1036 0
	str	r2, [r0, #84]
	.loc 1 1024 0
	str	r5, [r0, #3964]
	.loc 1 1028 0
	str	r5, [r0, #3976]
	.loc 1 1031 0
	str	r5, [r0, #88]
	.loc 1 1034 0
	str	r5, [r0, #76]
	.loc 1 1038 0
	str	r5, [r0, #3508]
	.loc 1 1042 0
	str	r5, [r0, #3520]
	.loc 1 1045 0
	str	r5, [r0, #28]
	.loc 1 1049 0
	str	r5, [r0, #3160]
	.loc 1 1053 0
	str	r5, [r0, #3148]
	.loc 1 1057 0
	str	r5, [r0, #3388]
	.loc 1 1061 0
	str	r5, [r0, #3400]
	.loc 1 1071 0
	str	r3, [r0, #3756]
	.loc 1 1074 0
	add	r3, r3, #42
	str	r3, [r0, #108]
	.loc 1 1081 0
	sub	r3, r3, #194
	str	r3, [r0, #3956]
	.loc 1 1082 0
	add	r3, r3, #198
	str	r3, [r0, #3960]
	.loc 1 1090 0
	add	r3, r3, lr
	str	r3, [r0, #3996]
	.loc 1 1093 0
	add	r3, r3, lr
	str	r3, [r0, #216]
	.loc 1 1101 0
	add	r3, r3, r5
	str	r3, [r0, #3804]
	.loc 1 1066 0
	sub	r3, r3, #211
	str	r3, [r0, #3764]
	.loc 1 1067 0
	add	r3, r3, #155
	str	r3, [r0, #3768]
	.loc 1 1069 0
	sub	r3, r3, #157
	str	r3, [r0, #3748]
	.loc 1 1070 0
	add	r3, r3, r5
	str	r3, [r0, #3752]
	.loc 1 1077 0
	add	r3, r3, #3
	str	r3, [r0, #3944]
	.loc 1 1078 0
	add	r3, r3, #198
	str	r3, [r0, #3948]
	.loc 1 1086 0
	add	r3, r3, lr
	str	r3, [r0, #4008]
	.loc 1 1092 0
	sub	r3, r3, #194
	b	.L5
.L6:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	278
	.word	318
	.word	525
	.word	531
	.word	594
	.word	550
	.word	602
	.word	625
	.word	718
	.word	705
	.word	723
.L5:
	str	r3, [r0, #212]
	.loc 1 1097 0
	add	r3, r3, #200
	.loc 1 1085 0
	mov	r4, #12
	.loc 1 1096 0
	mov	r8, #18
	.loc 1 1104 0
	mov	r9, #22
	.loc 1 1097 0
	str	r3, [r0, #3816]
	.loc 1 1105 0
	add	r3, r3, lr
	.loc 1 1160 0
	mov	r7, #6
	.loc 1 1105 0
	str	r3, [r0, #3276]
	.loc 1 1072 0
	str	lr, [r0, #100]
	.loc 1 1073 0
	str	lr, [r0, #104]
	.loc 1 1076 0
	str	lr, [r0, #3940]
	.loc 1 1080 0
	str	lr, [r0, #3952]
	.loc 1 1084 0
	str	lr, [r0, #4000]
	.loc 1 1085 0
	str	r4, [r0, #4004]
	.loc 1 1088 0
	str	lr, [r0, #3988]
	.loc 1 1089 0
	str	r4, [r0, #3992]
	.loc 1 1091 0
	str	lr, [r0, #208]
	.loc 1 1095 0
	str	lr, [r0, #3808]
	.loc 1 1096 0
	str	r8, [r0, #3812]
	.loc 1 1099 0
	str	lr, [r0, #3796]
	.loc 1 1100 0
	str	r8, [r0, #3800]
	.loc 1 1103 0
	str	lr, [r0, #3268]
	.loc 1 1104 0
	str	r9, [r0, #3272]
	.loc 1 1107 0
	str	lr, [r0, #3280]
	.loc 1 1108 0
	str	r9, [r0, #3284]
	.loc 1 1109 0
	str	r3, [r0, #3288]
	.loc 1 1112 0
	add	r3, r3, r5
	str	r3, [r0, #204]
	.loc 1 1120 0
	add	r3, r3, r7
	str	r3, [r0, #3564]
	.loc 1 1126 0
	add	r3, r3, r4
	str	r3, [r0, #24]
	.loc 1 1134 0
	add	r3, r3, #5
	str	r3, [r0, #3180]
	.loc 1 1141 0
	sub	r3, r3, #192
	str	r3, [r0, #3356]
	.loc 1 1142 0
	add	r3, r3, #198
	str	r3, [r0, #3360]
	.loc 1 1150 0
	add	r3, r3, #21
	str	r3, [r0, #3828]
	.loc 1 1111 0
	sub	r3, r3, #248
	str	r3, [r0, #200]
	.loc 1 1115 0
	add	r3, r3, r7
	str	r3, [r0, #3572]
	.loc 1 1116 0
	add	r3, r3, #198
	str	r3, [r0, #3576]
	.loc 1 1119 0
	sub	r3, r3, #198
	str	r3, [r0, #3560]
	.loc 1 1125 0
	add	r3, r3, r4
	str	r3, [r0, #20]
	.loc 1 1129 0
	add	r3, r3, #5
	str	r3, [r0, #3188]
	.loc 1 1130 0
	add	r3, r3, #198
	str	r3, [r0, #3192]
	.loc 1 1133 0
	sub	r3, r3, #198
	str	r3, [r0, #3176]
	.loc 1 1137 0
	add	r3, r3, r7
	str	r3, [r0, #3344]
	.loc 1 1138 0
	add	r3, r3, #198
	str	r3, [r0, #3348]
	.loc 1 1144 0
	sub	r3, r3, #246
	str	r3, [r0, #3832]
	.loc 1 1145 0
	add	r3, r3, r4
	str	r3, [r0, #3836]
	.loc 1 1146 0
	add	r3, r3, #255
	str	r3, [r0, #3840]
	.loc 1 1148 0
	mov	r3, #5
	str	r3, [r0, #3820]
	.loc 1 1149 0
	add	r3, r3, r4
	str	r3, [r0, #3824]
	.loc 1 1152 0
	sub	r3, r3, #12
	str	r3, [r0, #3292]
	.loc 1 1153 0
	add	r3, r3, r8
	str	r3, [r0, #3296]
	.loc 1 1154 0
	add	r3, r3, #255
	str	r3, [r0, #3300]
	.loc 1 1156 0
	mov	r3, #5
	.loc 1 1140 0
	str	lr, [r0, #3352]
	.loc 1 1110 0
	str	lr, [r0, #196]
	.loc 1 1114 0
	str	lr, [r0, #3568]
	.loc 1 1118 0
	str	lr, [r0, #3556]
	.loc 1 1124 0
	str	lr, [r0, #16]
	.loc 1 1128 0
	str	lr, [r0, #3184]
	.loc 1 1132 0
	str	lr, [r0, #3172]
	.loc 1 1136 0
	str	lr, [r0, #3340]
	.loc 1 1156 0
	str	r3, [r0, #3304]
	.loc 1 1158 0
	ldr	r3, .L4+8
	.loc 1 1188 0
	str	r7, [r0, #3208]
	.loc 1 1158 0
	str	r3, [r0, #3312]
	.loc 1 1166 0
	add	r3, r3, #40
	str	r3, [r0, #3828]
	.loc 1 1174 0
	add	r3, r3, lr
	str	r3, [r0, #3468]
	.loc 1 1182 0
	add	r3, r3, #16
	str	r3, [r0, #3444]
	.loc 1 1190 0
	add	r3, r3, r7
	str	r3, [r0, #3216]
	.loc 1 1193 0
	add	r3, r3, #21
	str	r3, [r0, #1860]
	.loc 1 1194 0
	mov	r3, #7
	str	r3, [r0, #1840]
	.loc 1 1196 0
	add	r3, r3, #360
	str	r3, [r0, #1848]
	.loc 1 1157 0
	sub	r3, r3, #344
	str	r3, [r0, #3308]
	.loc 1 1162 0
	ldr	r3, .L4+12
	.loc 1 1160 0
	str	r7, [r0, #3832]
	.loc 1 1162 0
	str	r3, [r0, #3840]
	.loc 1 1170 0
	add	r3, r3, lr
	str	r3, [r0, #3480]
	.loc 1 1177 0
	sub	r3, r3, #284
	str	r3, [r0, #3452]
	.loc 1 1178 0
	add	r3, r3, #300
	str	r3, [r0, #3456]
	.loc 1 1181 0
	sub	r3, r3, #300
	str	r3, [r0, #3440]
	.loc 1 1185 0
	add	r3, r3, r7
	str	r3, [r0, #3200]
	.loc 1 1186 0
	add	r3, r3, #300
	str	r3, [r0, #3204]
	.loc 1 1189 0
	sub	r3, r3, #300
	str	r3, [r0, #3212]
	.loc 1 1191 0
	sub	r3, r3, #37
	str	r3, [r0, #1852]
	.loc 1 1192 0
	add	r3, r3, r4
	str	r3, [r0, #1856]
	.loc 1 1195 0
	add	r3, r3, r5
	str	r3, [r0, #1844]
	.loc 1 1197 0
	sub	r3, r3, #12
	str	r3, [r0, #112]
	.loc 1 1198 0
	sub	r3, r3, #8
	.loc 1 1161 0
	str	r8, [r0, #3836]
	.loc 1 1164 0
	str	r7, [r0, #3820]
	.loc 1 1165 0
	str	r8, [r0, #3824]
	.loc 1 1168 0
	str	r7, [r0, #3472]
	.loc 1 1169 0
	str	r9, [r0, #3476]
	.loc 1 1172 0
	str	r7, [r0, #3460]
	.loc 1 1173 0
	str	r9, [r0, #3464]
	.loc 1 1176 0
	str	r7, [r0, #3448]
	.loc 1 1180 0
	str	r7, [r0, #3436]
	.loc 1 1184 0
	str	r7, [r0, #3196]
	.loc 1 1198 0
	str	r3, [r0, #116]
	.loc 1 1201 0
	add	r3, r3, r8
	str	r3, [r0, #1868]
	.loc 1 1202 0
	add	r3, r3, #440
	str	r3, [r0, #1872]
	.loc 1 1203 0
	mov	r3, #9
	str	r3, [r0, #1876]
	.loc 1 1204 0
	add	r3, r3, r4
	str	r3, [r0, #1880]
	.loc 1 1205 0
	add	r3, r3, #440
	str	r3, [r0, #1884]
	.loc 1 1213 0
	add	r3, r3, #44
	str	r3, [r0, #3660]
	.loc 1 1221 0
	add	r3, r3, lr
	str	r3, [r0, #3864]
	.loc 1 1228 0
	mov	r3, #38
	str	r3, [r0, #3116]
	.loc 1 1229 0
	ldr	r3, .L4+16
	.loc 1 1199 0
	add	r2, r2, #316
	.loc 1 1229 0
	str	r3, [r0, #3120]
	.loc 1 1236 0
	mov	r3, #44
	str	r3, [r0, #3248]
	.loc 1 1237 0
	ldr	r3, .L4+20
	.loc 1 1199 0
	str	r2, [r0, #120]
	.loc 1 1237 0
	str	r3, [r0, #3252]
	.loc 1 1200 0
	mov	r3, #9
	str	r3, [r0, #1864]
	.loc 1 1209 0
	add	r3, r3, #496
	str	r3, [r0, #3672]
	.loc 1 1217 0
	add	r3, r3, lr
	str	r3, [r0, #3852]
	.loc 1 1224 0
	mov	r3, #38
	str	r3, [r0, #3104]
	.loc 1 1225 0
	ldr	r3, .L4+16
	.loc 1 1207 0
	str	r6, [r0, #3664]
	.loc 1 1225 0
	str	r3, [r0, #3108]
	.loc 1 1232 0
	mov	r3, #44
	str	r3, [r0, #3260]
	.loc 1 1233 0
	ldr	r3, .L4+20
	.loc 1 1208 0
	str	r8, [r0, #3668]
	.loc 1 1233 0
	str	r3, [r0, #3264]
	.loc 1 1239 0
	sub	r3, r3, #520
	str	r3, [r0, #3712]
	.loc 1 1240 0
	sub	r3, r3, #8
	str	r3, [r0, #3716]
	.loc 1 1211 0
	str	r6, [r0, #3652]
	.loc 1 1212 0
	str	r8, [r0, #3656]
	.loc 1 1215 0
	str	r6, [r0, #3844]
	.loc 1 1216 0
	str	r9, [r0, #3848]
	.loc 1 1219 0
	str	r6, [r0, #3856]
	.loc 1 1220 0
	str	r9, [r0, #3860]
	.loc 1 1223 0
	str	r6, [r0, #3100]
	.loc 1 1227 0
	str	r6, [r0, #3112]
	.loc 1 1231 0
	str	r6, [r0, #3256]
	.loc 1 1235 0
	str	r6, [r0, #3244]
	.loc 1 1244 0
	str	r3, [r0, #3704]
	.loc 1 1245 0
	mov	r3, #536
	str	r3, [r0, #3708]
	.loc 1 1252 0
	mov	r3, #17
	str	r3, [r0, #3872]
	.loc 1 1253 0
	ldr	r3, .L4+28
	.loc 1 1279 0
	str	r8, [r0, #3692]
	.loc 1 1253 0
	str	r3, [r0, #3876]
	.loc 1 1259 0
	mov	r3, #11
	str	r3, [r0, #4024]
	.loc 1 1260 0
	add	r3, r3, r4
	str	r3, [r0, #4028]
	.loc 1 1261 0
	mov	r3, #556
	str	r3, [r0, #4032]
	.loc 1 1269 0
	add	r3, r3, #32
	str	r3, [r0, #3912]
	.loc 1 1271 0
	sub	r3, r3, #572
	str	r3, [r0, #128]
	.loc 1 1272 0
	ldr	r3, .L4+24
	.loc 1 1263 0
	str	r4, [r0, #3892]
	.loc 1 1272 0
	str	r3, [r0, #132]
	.loc 1 1280 0
	add	r3, r3, r5
	str	r3, [r0, #3696]
	.loc 1 1241 0
	sub	r3, r3, #60
	str	r3, [r0, #3720]
	.loc 1 1243 0
	mov	r3, #11
	str	r3, [r0, #3700]
	.loc 1 1247 0
	str	r3, [r0, #3880]
	.loc 1 1248 0
	add	r3, r3, r7
	str	r3, [r0, #3884]
	.loc 1 1249 0
	ldr	r3, .L4+28
	.loc 1 1264 0
	str	r6, [r0, #3896]
	.loc 1 1249 0
	str	r3, [r0, #3888]
	.loc 1 1251 0
	mov	r3, #11
	str	r3, [r0, #3868]
	.loc 1 1255 0
	str	r3, [r0, #4012]
	.loc 1 1256 0
	add	r3, r3, r4
	str	r3, [r0, #4016]
	.loc 1 1257 0
	mov	r3, #556
	str	r3, [r0, #4020]
	.loc 1 1265 0
	add	r3, r3, #32
	str	r3, [r0, #3900]
	.loc 1 1276 0
	add	r3, r3, #8
	str	r3, [r0, #3684]
	.loc 1 1284 0
	add	r3, r3, lr
	str	r3, [r0, #3324]
	.loc 1 1267 0
	str	r4, [r0, #3904]
	.loc 1 1268 0
	str	r6, [r0, #3908]
	.loc 1 1270 0
	str	r4, [r0, #124]
	.loc 1 1274 0
	str	r4, [r0, #3676]
	.loc 1 1275 0
	str	r8, [r0, #3680]
	.loc 1 1278 0
	str	r4, [r0, #3688]
	.loc 1 1282 0
	str	r4, [r0, #3316]
	.loc 1 1283 0
	str	r9, [r0, #3320]
	.loc 1 1287 0
	str	r9, [r0, #3332]
	.loc 1 1288 0
	str	r3, [r0, #3336]
	.loc 1 1290 0
	sub	r3, r3, #576
	str	r3, [r0, #164]
	.loc 1 1291 0
	ldr	r3, .L4+32
	.loc 1 1302 0
	add	r2, r2, #173
	.loc 1 1291 0
	str	r3, [r0, #168]
	.loc 1 1298 0
	sub	r3, r3, #572
	str	r3, [r0, #3596]
	.loc 1 1299 0
	mov	r3, #608
	str	r3, [r0, #3600]
	.loc 1 1301 0
	sub	r3, r3, #572
	str	r3, [r0, #188]
	.loc 1 1304 0
	add	r3, r3, r7
	str	r3, [r0, #56]
	.loc 1 1305 0
	mov	r3, #620
	str	r3, [r0, #60]
	.loc 1 1312 0
	mov	r3, #47
	str	r3, [r0, #3236]
	.loc 1 1313 0
	ldr	r3, .L4+36
	.loc 1 1302 0
	str	r2, [r0, #192]
	.loc 1 1313 0
	str	r3, [r0, #3240]
	.loc 1 1319 0
	sub	r3, r3, #612
	str	r3, [r0, #3736]
	.loc 1 1321 0
	add	r3, r3, #624
	str	r3, [r0, #3744]
	.loc 1 1294 0
	mov	r3, #30
	str	r3, [r0, #3584]
	.loc 1 1295 0
	mov	r3, #608
	str	r3, [r0, #3588]
	.loc 1 1308 0
	mov	r3, #47
	str	r3, [r0, #3224]
	.loc 1 1309 0
	ldr	r3, .L4+36
	.loc 1 1311 0
	str	r4, [r0, #3232]
	.loc 1 1309 0
	str	r3, [r0, #3228]
	.loc 1 1315 0
	sub	r3, r3, #612
	str	r3, [r0, #3724]
	.loc 1 1317 0
	add	r3, r3, #624
	str	r3, [r0, #3732]
	.loc 1 1325 0
	add	r3, r3, #51
	str	r3, [r0, #3924]
	.loc 1 1351 0
	add	r3, r3, #35
	.loc 1 1320 0
	str	r5, [r0, #3740]
	.loc 1 1286 0
	str	r4, [r0, #3328]
	.loc 1 1289 0
	str	r4, [r0, #160]
	.loc 1 1293 0
	str	r4, [r0, #3580]
	.loc 1 1297 0
	str	r4, [r0, #3592]
	.loc 1 1300 0
	str	r4, [r0, #184]
	.loc 1 1303 0
	str	r4, [r0, #52]
	.loc 1 1307 0
	str	r4, [r0, #3220]
	.loc 1 1316 0
	str	r5, [r0, #3728]
	.loc 1 1323 0
	str	fp, [r0, #3916]
	.loc 1 1324 0
	str	r6, [r0, #3920]
	.loc 1 1327 0
	str	fp, [r0, #3928]
	.loc 1 1351 0
	str	r3, [r0, #3096]
	.loc 1 1329 0
	sub	r3, r3, #35
	str	r3, [r0, #3936]
	.loc 1 1336 0
	mov	r3, #27
	str	r3, [r0, #3620]
	.loc 1 1337 0
	ldr	r3, .L4+44
	.loc 1 1340 0
	add	r2, r2, #98
	.loc 1 1337 0
	str	r3, [r0, #3624]
	.loc 1 1339 0
	mov	r3, #34
	str	r3, [r0, #140]
	.loc 1 1342 0
	add	r3, r3, r7
	str	r3, [r0, #152]
	.loc 1 1343 0
	ldr	r3, .L4+40
	.loc 1 1328 0
	str	r6, [r0, #3932]
	.loc 1 1343 0
	str	r3, [r0, #156]
	.loc 1 1350 0
	mov	r3, #45
	str	r3, [r0, #3092]
	.loc 1 1332 0
	sub	r3, r3, #18
	str	r3, [r0, #3608]
	.loc 1 1333 0
	ldr	r3, .L4+44
	.loc 1 1340 0
	str	r2, [r0, #144]
	.loc 1 1333 0
	str	r3, [r0, #3612]
	.loc 1 1346 0
	sub	r3, r3, #660
	str	r3, [r0, #3080]
	.loc 1 1347 0
	ldr	r3, .L4+48
	.loc 1 1349 0
	str	fp, [r0, #3088]
	.loc 1 1331 0
	str	fp, [r0, #3604]
	.loc 1 1335 0
	str	fp, [r0, #3616]
	.loc 1 1338 0
	str	fp, [r0, #136]
	.loc 1 1341 0
	str	fp, [r0, #148]
	.loc 1 1345 0
	str	fp, [r0, #3076]
	.loc 1 1347 0
	str	r3, [r0, #3084]
	.loc 1 1352 0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.LFE2:
	.size	TrainMap_Initialize_B, .-TrainMap_Initialize_B
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.byte	0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0x0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI0-.LFB2
	.byte	0xe
	.uleb128 0x24
	.byte	0x8e
	.uleb128 0x1
	.byte	0x8b
	.uleb128 0x2
	.byte	0x8a
	.uleb128 0x3
	.byte	0x89
	.uleb128 0x4
	.byte	0x88
	.uleb128 0x5
	.byte	0x87
	.uleb128 0x6
	.byte	0x86
	.uleb128 0x7
	.byte	0x85
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x9
	.align	2
.LEFDE0:
	.file 2 "maps/map.h"
	.file 3 "maps/../queue.h"
	.file 4 "maps/../train.h"
	.text
.Letext0:
	.section	.debug_info
	.4byte	0x1fd
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	.Letext0
	.4byte	.Ltext0
	.4byte	.LASF22
	.byte	0x1
	.4byte	.LASF23
	.4byte	.LASF24
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x4
	.byte	0x7
	.uleb128 0x3
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x8
	.uleb128 0x4
	.byte	0x4
	.4byte	0x3a
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x8
	.byte	0x4
	.uleb128 0x5
	.4byte	0x85
	.4byte	.LASF5
	.byte	0xc
	.byte	0x2
	.byte	0x6
	.uleb128 0x6
	.ascii	"row\000"
	.byte	0x2
	.byte	0x7
	.4byte	0x33
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x6
	.ascii	"col\000"
	.byte	0x2
	.byte	0x8
	.4byte	0x33
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.4byte	.LASF4
	.byte	0x2
	.byte	0x9
	.4byte	0x33
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x8
	.4byte	.LASF5
	.byte	0x2
	.byte	0xa
	.4byte	0x4e
	.uleb128 0x9
	.4byte	0xc9
	.4byte	.LASF6
	.2byte	0x3c04
	.byte	0x2
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF7
	.byte	0x2
	.byte	0xd
	.4byte	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0xe
	.4byte	0xc9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x2
	.byte	0xf
	.4byte	0xd9
	.byte	0x3
	.byte	0x23
	.uleb128 0xc04
	.byte	0x0
	.uleb128 0xa
	.4byte	0xd9
	.4byte	0x85
	.uleb128 0xb
	.4byte	0x2c
	.byte	0xff
	.byte	0x0
	.uleb128 0xa
	.4byte	0xea
	.4byte	0x85
	.uleb128 0xc
	.4byte	0x2c
	.2byte	0x3ff
	.byte	0x0
	.uleb128 0x8
	.4byte	.LASF6
	.byte	0x2
	.byte	0x10
	.4byte	0x90
	.uleb128 0xd
	.4byte	0x11b
	.byte	0x1
	.4byte	.LASF25
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0xe
	.ascii	"map\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x11b
	.byte	0x1
	.byte	0x50
	.byte	0x0
	.uleb128 0x4
	.byte	0x4
	.4byte	0xea
	.uleb128 0xf
	.4byte	.LASF10
	.byte	0x3
	.byte	0x9
	.4byte	0x12d
	.sleb128 -1
	.uleb128 0x10
	.4byte	0x33
	.uleb128 0xf
	.4byte	.LASF11
	.byte	0x3
	.byte	0xa
	.4byte	0x12d
	.sleb128 -2
	.uleb128 0xa
	.4byte	0x14e
	.4byte	0x3a
	.uleb128 0xb
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x11
	.4byte	.LASF12
	.byte	0x4
	.byte	0xb
	.4byte	0x15d
	.4byte	.LASF13
	.uleb128 0x10
	.4byte	0x13e
	.uleb128 0xa
	.4byte	0x172
	.4byte	0x3a
	.uleb128 0xb
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x11
	.4byte	.LASF14
	.byte	0x4
	.byte	0xc
	.4byte	0x181
	.4byte	.LASF15
	.uleb128 0x10
	.4byte	0x162
	.uleb128 0xa
	.4byte	0x196
	.4byte	0x3a
	.uleb128 0xb
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x11
	.4byte	.LASF16
	.byte	0x4
	.byte	0xd
	.4byte	0x1a5
	.4byte	.LASF17
	.uleb128 0x10
	.4byte	0x186
	.uleb128 0xa
	.4byte	0x1ba
	.4byte	0x3a
	.uleb128 0xb
	.4byte	0x2c
	.byte	0x6
	.byte	0x0
	.uleb128 0x11
	.4byte	.LASF18
	.byte	0x4
	.byte	0xe
	.4byte	0x1c9
	.4byte	.LASF19
	.uleb128 0x10
	.4byte	0x1aa
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x4
	.byte	0x10
	.4byte	0x12d
	.byte	0x10
	.uleb128 0xa
	.4byte	0x1f0
	.4byte	0x3a
	.uleb128 0xb
	.4byte	0x2c
	.byte	0x5
	.uleb128 0xb
	.4byte	0x2c
	.byte	0x13
	.byte	0x0
	.uleb128 0x13
	.4byte	.LASF21
	.byte	0x4
	.byte	0x6d
	.4byte	0x1fb
	.uleb128 0x10
	.4byte	0x1da
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x28
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x201
	.4byte	0xf5
	.ascii	"TrainMap_Initialize_B\000"
	.4byte	0x0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",%progbits,1
.LASF15:
	.ascii	"TCmSvr\000"
.LASF17:
	.ascii	"TrSTmr\000"
.LASF10:
	.ascii	"ERR_QUEUE_FULL\000"
.LASF5:
	.ascii	"TrainMapLabelPosition\000"
.LASF23:
	.ascii	"maps/map_b.c\000"
.LASF14:
	.ascii	"TRAIN_COMMAND_SERVER_NAME\000"
.LASF3:
	.ascii	"double\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF6:
	.ascii	"TrainMap\000"
.LASF8:
	.ascii	"switches\000"
.LASF11:
	.ascii	"ERR_QUEUE_PRIORITY\000"
.LASF21:
	.ascii	"TRAIN_ENGINE_STATE_NAMES\000"
.LASF18:
	.ascii	"TRAIN_SWITCH_MASTER_NAME\000"
.LASF12:
	.ascii	"TRAIN_SERVER_NAME\000"
.LASF19:
	.ascii	"TrSwMr\000"
.LASF20:
	.ascii	"LIGHTS_MASK\000"
.LASF25:
	.ascii	"TrainMap_Initialize_B\000"
.LASF16:
	.ascii	"TRAIN_SERVER_TIMER_NAME\000"
.LASF13:
	.ascii	"TrnSvr\000"
.LASF9:
	.ascii	"sensors\000"
.LASF2:
	.ascii	"char\000"
.LASF24:
	.ascii	"/u0/relder/cs452/CS452/io/project1\000"
.LASF22:
	.ascii	"GNU C 4.0.2\000"
.LASF7:
	.ascii	"ascii\000"
.LASF4:
	.ascii	"ascii_offset\000"
	.ident	"GCC: (GNU) 4.0.2"
