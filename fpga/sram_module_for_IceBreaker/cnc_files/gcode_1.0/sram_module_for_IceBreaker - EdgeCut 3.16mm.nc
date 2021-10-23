(G-CODE GENERATED BY FLATCAM v8.994 - www.flatcam.org - Version Date: 2020/11/7)

(Name: sram_module_for_IceBreaker-Edge_Cuts.gbr_cutout_1_cnc)
(Type: G-code from Geometry)
(Units: MM)

(Created on Monday, 18 October 2021 at 20:51)

(This preprocessor is the default preprocessor used by FlatCAM.)
(It is made to work with MACH3 compatible motion controllers.)

(TOOL DIAMETER: 3.16 mm)
(Feedrate_XY: 500.0 mm/min)
(Feedrate_Z: 60.0 mm/min)
(Feedrate rapids 1500.0 mm/min)

(Z_Cut: -1.9 mm)
(DepthPerCut: 0.475 mm <=>4 passes)
(Z_Move: 1.0 mm)
(Z Start: None mm)
(Z End: 15.0 mm)
(X,Y End: None mm)
(Steps per circle: 64)
(Preprocessor Geometry: default)

(X range:   -1.6500 ...   26.5600  mm)
(Y range:   -1.6225 ...   26.5875  mm)

(Spindle Speed: 0.0 RPM)
G21
G90
G94

G01 F500.00

M5
G00 Z15.0000
G00 X0.0000 Y0.0000
T1
M6    
(MSG, Change to Tool Dia = 3.1600)
M0
G00 Z15.0000

M03
G01 F500.00
G00 X-1.6500 Y22.9825
G01 F60.00
G01 Z-0.4750
G01 F500.00
G01 X-1.6481 Y23.0613
G01 X-1.6384 Y23.2573
G01 X-1.6327 Y23.3346
G01 X-1.6230 Y23.4140
G01 X-1.5942 Y23.6082
G01 X-1.5810 Y23.6846
G01 X-1.5635 Y23.7627
G01 X-1.5158 Y23.9531
G01 X-1.4951 Y24.0278
G01 X-1.4701 Y24.1038
G01 X-1.4039 Y24.2886
G01 X-1.3751 Y24.3632
G01 X-1.3437 Y24.4341
G01 X-1.2598 Y24.6115
G01 X-1.2237 Y24.6830
G01 X-1.1855 Y24.7504
G01 X-1.0846 Y24.9188
G01 X-1.0418 Y24.9863
G01 X-0.9971 Y25.0497
G01 X-0.8802 Y25.2074
G01 X-0.8309 Y25.2704
G01 X-0.7803 Y25.3291
G01 X-0.6484 Y25.4746
G01 X-0.5932 Y25.5325
G01 X-0.5371 Y25.5859
G01 X-0.3916 Y25.7178
G01 X-0.3310 Y25.7700
G01 X-0.2699 Y25.8177
G01 X-0.1122 Y25.9346
G01 X-0.0468 Y25.9806
G01 X0.0187 Y26.0221
G01 X0.1871 Y26.1230
G01 X0.2567 Y26.1624
G01 X0.3260 Y26.1973
G01 X0.5034 Y26.2812
G01 X0.5766 Y26.3135
G01 X0.6489 Y26.3414
G01 X0.8337 Y26.4076
G01 X0.9097 Y26.4326
G01 X0.9844 Y26.4533
G01 X1.1748 Y26.5010
G01 X1.2529 Y26.5185
G01 X1.3293 Y26.5317
G01 X1.5235 Y26.5605
G01 X1.6004 Y26.5700
G01 X1.6802 Y26.5759
G01 X1.8762 Y26.5856
G01 X1.9150 Y26.5870
G01 X1.9550 Y26.5875
G01 X22.9550 Y26.5875
G01 X22.9950 Y26.5870
G01 X23.0338 Y26.5856
G01 X23.2298 Y26.5759
G01 X23.3096 Y26.5700
G01 X23.3865 Y26.5605
G01 X23.5807 Y26.5317
G01 X23.6571 Y26.5185
G01 X23.7352 Y26.5010
G01 X23.9256 Y26.4533
G01 X24.0003 Y26.4326
G01 X24.0763 Y26.4076
G01 X24.2611 Y26.3414
G01 X24.3357 Y26.3126
G01 X24.4066 Y26.2812
G01 X24.5840 Y26.1973
G01 X24.6555 Y26.1612
G01 X24.7229 Y26.1230
G01 X24.8913 Y26.0221
G01 X24.9588 Y25.9793
G01 X25.0222 Y25.9346
G01 X25.1799 Y25.8177
G01 X25.2429 Y25.7684
G01 X25.3016 Y25.7178
G01 X25.4471 Y25.5859
G01 X25.5050 Y25.5307
G01 X25.5584 Y25.4746
G01 X25.6903 Y25.3291
G01 X25.7425 Y25.2685
G01 X25.7902 Y25.2074
G01 X25.9071 Y25.0497
G01 X25.9531 Y24.9843
G01 X25.9946 Y24.9188
G01 X26.0955 Y24.7504
G01 X26.1349 Y24.6808
G01 X26.1698 Y24.6115
G01 X26.2537 Y24.4341
G01 X26.2860 Y24.3609
G01 X26.3139 Y24.2886
G01 X26.3801 Y24.1038
G01 X26.4051 Y24.0278
G01 X26.4258 Y23.9531
G01 X26.4735 Y23.7627
G01 X26.4910 Y23.6846
G01 X26.5042 Y23.6082
G01 X26.5330 Y23.4140
G01 X26.5425 Y23.3371
G01 X26.5484 Y23.2573
G01 X26.5581 Y23.0613
G01 X26.5595 Y23.0213
G01 X26.5600 Y22.9825
G01 X26.5600 Y1.9825
G01 X26.5595 Y1.9425
G01 X26.5581 Y1.9037
G01 X26.5484 Y1.7077
G01 X26.5425 Y1.6279
G01 X26.5330 Y1.5510
G01 X26.5042 Y1.3568
G01 X26.4910 Y1.2804
G01 X26.4735 Y1.2023
G01 X26.4258 Y1.0119
G01 X26.4051 Y0.9372
G01 X26.3801 Y0.8612
G01 X26.3139 Y0.6764
G01 X26.2851 Y0.6018
G01 X26.2537 Y0.5309
G01 X26.1698 Y0.3535
G01 X26.1337 Y0.2820
G01 X26.0955 Y0.2146
G01 X25.9946 Y0.0462
G01 X25.9518 Y-0.0213
G01 X25.9071 Y-0.0847
G01 X25.7902 Y-0.2424
G01 X25.7409 Y-0.3054
G01 X25.6903 Y-0.3641
G01 X25.5584 Y-0.5096
G01 X25.5032 Y-0.5675
G01 X25.4471 Y-0.6209
G01 X25.3016 Y-0.7528
G01 X25.2410 Y-0.8050
G01 X25.1799 Y-0.8527
G01 X25.0222 Y-0.9696
G01 X24.9568 Y-1.0156
G01 X24.8913 Y-1.0571
G01 X24.7229 Y-1.1580
G01 X24.6533 Y-1.1974
G01 X24.5840 Y-1.2323
G01 X24.4066 Y-1.3162
G01 X24.3334 Y-1.3485
G01 X24.2611 Y-1.3764
G01 X24.0763 Y-1.4426
G01 X24.0003 Y-1.4676
G01 X23.9256 Y-1.4883
G01 X23.7352 Y-1.5360
G01 X23.6571 Y-1.5535
G01 X23.5807 Y-1.5667
G01 X23.3865 Y-1.5955
G01 X23.3096 Y-1.6050
G01 X23.2298 Y-1.6109
G01 X23.0338 Y-1.6206
G01 X22.9938 Y-1.6220
G01 X22.9550 Y-1.6225
G01 X1.9550 Y-1.6225
G01 X1.9150 Y-1.6220
G01 X1.8762 Y-1.6206
G01 X1.6802 Y-1.6109
G01 X1.6004 Y-1.6050
G01 X1.5235 Y-1.5955
G01 X1.3293 Y-1.5667
G01 X1.2529 Y-1.5535
G01 X1.1748 Y-1.5360
G01 X0.9844 Y-1.4883
G01 X0.9097 Y-1.4676
G01 X0.8337 Y-1.4426
G01 X0.6489 Y-1.3764
G01 X0.5743 Y-1.3476
G01 X0.5034 Y-1.3162
G01 X0.3260 Y-1.2323
G01 X0.2545 Y-1.1962
G01 X0.1871 Y-1.1580
G01 X0.0187 Y-1.0571
G01 X-0.0488 Y-1.0143
G01 X-0.1122 Y-0.9696
G01 X-0.2699 Y-0.8527
G01 X-0.3329 Y-0.8034
G01 X-0.3916 Y-0.7528
G01 X-0.5371 Y-0.6209
G01 X-0.5950 Y-0.5657
G01 X-0.6484 Y-0.5096
G01 X-0.7803 Y-0.3641
G01 X-0.8325 Y-0.3035
G01 X-0.8802 Y-0.2424
G01 X-0.9971 Y-0.0847
G01 X-1.0431 Y-0.0193
G01 X-1.0846 Y0.0462
G01 X-1.1855 Y0.2146
G01 X-1.2249 Y0.2842
G01 X-1.2598 Y0.3535
G01 X-1.3437 Y0.5309
G01 X-1.3760 Y0.6041
G01 X-1.4039 Y0.6764
G01 X-1.4701 Y0.8612
G01 X-1.4951 Y0.9372
G01 X-1.5158 Y1.0119
G01 X-1.5635 Y1.2023
G01 X-1.5810 Y1.2804
G01 X-1.5942 Y1.3568
G01 X-1.6230 Y1.5510
G01 X-1.6327 Y1.6304
G01 X-1.6384 Y1.7077
G01 X-1.6481 Y1.9037
G01 X-1.6495 Y1.9425
G01 X-1.6500 Y1.9825
G01 X-1.6500 Y22.9825
G00 X-1.6500 Y22.9825
G01 F60.00
G01 Z-0.9500
G01 F500.00
G01 X-1.6500 Y1.9825
G01 X-1.6495 Y1.9425
G01 X-1.6481 Y1.9037
G01 X-1.6384 Y1.7077
G01 X-1.6327 Y1.6304
G01 X-1.6230 Y1.5510
G01 X-1.5942 Y1.3568
G01 X-1.5810 Y1.2804
G01 X-1.5635 Y1.2023
G01 X-1.5158 Y1.0119
G01 X-1.4951 Y0.9372
G01 X-1.4701 Y0.8612
G01 X-1.4039 Y0.6764
G01 X-1.3760 Y0.6041
G01 X-1.3437 Y0.5309
G01 X-1.2598 Y0.3535
G01 X-1.2249 Y0.2842
G01 X-1.1855 Y0.2146
G01 X-1.0846 Y0.0462
G01 X-1.0431 Y-0.0193
G01 X-0.9971 Y-0.0847
G01 X-0.8802 Y-0.2424
G01 X-0.8325 Y-0.3035
G01 X-0.7803 Y-0.3641
G01 X-0.6484 Y-0.5096
G01 X-0.5950 Y-0.5657
G01 X-0.5371 Y-0.6209
G01 X-0.3916 Y-0.7528
G01 X-0.3329 Y-0.8034
G01 X-0.2699 Y-0.8527
G01 X-0.1122 Y-0.9696
G01 X-0.0488 Y-1.0143
G01 X0.0187 Y-1.0571
G01 X0.1871 Y-1.1580
G01 X0.2545 Y-1.1962
G01 X0.3260 Y-1.2323
G01 X0.5034 Y-1.3162
G01 X0.5743 Y-1.3476
G01 X0.6489 Y-1.3764
G01 X0.8337 Y-1.4426
G01 X0.9097 Y-1.4676
G01 X0.9844 Y-1.4883
G01 X1.1748 Y-1.5360
G01 X1.2529 Y-1.5535
G01 X1.3293 Y-1.5667
G01 X1.5235 Y-1.5955
G01 X1.6004 Y-1.6050
G01 X1.6802 Y-1.6109
G01 X1.8762 Y-1.6206
G01 X1.9150 Y-1.6220
G01 X1.9550 Y-1.6225
G01 X22.9550 Y-1.6225
G01 X22.9938 Y-1.6220
G01 X23.0338 Y-1.6206
G01 X23.2298 Y-1.6109
G01 X23.3096 Y-1.6050
G01 X23.3865 Y-1.5955
G01 X23.5807 Y-1.5667
G01 X23.6571 Y-1.5535
G01 X23.7352 Y-1.5360
G01 X23.9256 Y-1.4883
G01 X24.0003 Y-1.4676
G01 X24.0763 Y-1.4426
G01 X24.2611 Y-1.3764
G01 X24.3334 Y-1.3485
G01 X24.4066 Y-1.3162
G01 X24.5840 Y-1.2323
G01 X24.6533 Y-1.1974
G01 X24.7229 Y-1.1580
G01 X24.8913 Y-1.0571
G01 X24.9568 Y-1.0156
G01 X25.0222 Y-0.9696
G01 X25.1799 Y-0.8527
G01 X25.2410 Y-0.8050
G01 X25.3016 Y-0.7528
G01 X25.4471 Y-0.6209
G01 X25.5032 Y-0.5675
G01 X25.5584 Y-0.5096
G01 X25.6903 Y-0.3641
G01 X25.7409 Y-0.3054
G01 X25.7902 Y-0.2424
G01 X25.9071 Y-0.0847
G01 X25.9518 Y-0.0213
G01 X25.9946 Y0.0462
G01 X26.0955 Y0.2146
G01 X26.1337 Y0.2820
G01 X26.1698 Y0.3535
G01 X26.2537 Y0.5309
G01 X26.2851 Y0.6018
G01 X26.3139 Y0.6764
G01 X26.3801 Y0.8612
G01 X26.4051 Y0.9372
G01 X26.4258 Y1.0119
G01 X26.4735 Y1.2023
G01 X26.4910 Y1.2804
G01 X26.5042 Y1.3568
G01 X26.5330 Y1.5510
G01 X26.5425 Y1.6279
G01 X26.5484 Y1.7077
G01 X26.5581 Y1.9037
G01 X26.5595 Y1.9425
G01 X26.5600 Y1.9825
G01 X26.5600 Y22.9825
G01 X26.5595 Y23.0213
G01 X26.5581 Y23.0613
G01 X26.5484 Y23.2573
G01 X26.5425 Y23.3371
G01 X26.5330 Y23.4140
G01 X26.5042 Y23.6082
G01 X26.4910 Y23.6846
G01 X26.4735 Y23.7627
G01 X26.4258 Y23.9531
G01 X26.4051 Y24.0278
G01 X26.3801 Y24.1038
G01 X26.3139 Y24.2886
G01 X26.2860 Y24.3609
G01 X26.2537 Y24.4341
G01 X26.1698 Y24.6115
G01 X26.1349 Y24.6808
G01 X26.0955 Y24.7504
G01 X25.9946 Y24.9188
G01 X25.9531 Y24.9843
G01 X25.9071 Y25.0497
G01 X25.7902 Y25.2074
G01 X25.7425 Y25.2685
G01 X25.6903 Y25.3291
G01 X25.5584 Y25.4746
G01 X25.5050 Y25.5307
G01 X25.4471 Y25.5859
G01 X25.3016 Y25.7178
G01 X25.2429 Y25.7684
G01 X25.1799 Y25.8177
G01 X25.0222 Y25.9346
G01 X24.9588 Y25.9793
G01 X24.8913 Y26.0221
G01 X24.7229 Y26.1230
G01 X24.6555 Y26.1612
G01 X24.5840 Y26.1973
G01 X24.4066 Y26.2812
G01 X24.3357 Y26.3126
G01 X24.2611 Y26.3414
G01 X24.0763 Y26.4076
G01 X24.0003 Y26.4326
G01 X23.9256 Y26.4533
G01 X23.7352 Y26.5010
G01 X23.6571 Y26.5185
G01 X23.5807 Y26.5317
G01 X23.3865 Y26.5605
G01 X23.3096 Y26.5700
G01 X23.2298 Y26.5759
G01 X23.0338 Y26.5856
G01 X22.9950 Y26.5870
G01 X22.9550 Y26.5875
G01 X1.9550 Y26.5875
G01 X1.9150 Y26.5870
G01 X1.8762 Y26.5856
G01 X1.6802 Y26.5759
G01 X1.6004 Y26.5700
G01 X1.5235 Y26.5605
G01 X1.3293 Y26.5317
G01 X1.2529 Y26.5185
G01 X1.1748 Y26.5010
G01 X0.9844 Y26.4533
G01 X0.9097 Y26.4326
G01 X0.8337 Y26.4076
G01 X0.6489 Y26.3414
G01 X0.5766 Y26.3135
G01 X0.5034 Y26.2812
G01 X0.3260 Y26.1973
G01 X0.2567 Y26.1624
G01 X0.1871 Y26.1230
G01 X0.0187 Y26.0221
G01 X-0.0468 Y25.9806
G01 X-0.1122 Y25.9346
G01 X-0.2699 Y25.8177
G01 X-0.3310 Y25.7700
G01 X-0.3916 Y25.7178
G01 X-0.5371 Y25.5859
G01 X-0.5932 Y25.5325
G01 X-0.6484 Y25.4746
G01 X-0.7803 Y25.3291
G01 X-0.8309 Y25.2704
G01 X-0.8802 Y25.2074
G01 X-0.9971 Y25.0497
G01 X-1.0418 Y24.9863
G01 X-1.0846 Y24.9188
G01 X-1.1855 Y24.7504
G01 X-1.2237 Y24.6830
G01 X-1.2598 Y24.6115
G01 X-1.3437 Y24.4341
G01 X-1.3751 Y24.3632
G01 X-1.4039 Y24.2886
G01 X-1.4701 Y24.1038
G01 X-1.4951 Y24.0278
G01 X-1.5158 Y23.9531
G01 X-1.5635 Y23.7627
G01 X-1.5810 Y23.6846
G01 X-1.5942 Y23.6082
G01 X-1.6230 Y23.4140
G01 X-1.6327 Y23.3346
G01 X-1.6384 Y23.2573
G01 X-1.6481 Y23.0613
G01 X-1.6500 Y22.9825
G00 X-1.6500 Y22.9825
G01 F60.00
G01 Z-1.4250
G01 F500.00
G01 X-1.6481 Y23.0613
G01 X-1.6384 Y23.2573
G01 X-1.6327 Y23.3346
G01 X-1.6230 Y23.4140
G01 X-1.5942 Y23.6082
G01 X-1.5810 Y23.6846
G01 X-1.5635 Y23.7627
G01 X-1.5158 Y23.9531
G01 X-1.4951 Y24.0278
G01 X-1.4701 Y24.1038
G01 X-1.4039 Y24.2886
G01 X-1.3751 Y24.3632
G01 X-1.3437 Y24.4341
G01 X-1.2598 Y24.6115
G01 X-1.2237 Y24.6830
G01 X-1.1855 Y24.7504
G01 X-1.0846 Y24.9188
G01 X-1.0418 Y24.9863
G01 X-0.9971 Y25.0497
G01 X-0.8802 Y25.2074
G01 X-0.8309 Y25.2704
G01 X-0.7803 Y25.3291
G01 X-0.6484 Y25.4746
G01 X-0.5932 Y25.5325
G01 X-0.5371 Y25.5859
G01 X-0.3916 Y25.7178
G01 X-0.3310 Y25.7700
G01 X-0.2699 Y25.8177
G01 X-0.1122 Y25.9346
G01 X-0.0468 Y25.9806
G01 X0.0187 Y26.0221
G01 X0.1871 Y26.1230
G01 X0.2567 Y26.1624
G01 X0.3260 Y26.1973
G01 X0.5034 Y26.2812
G01 X0.5766 Y26.3135
G01 X0.6489 Y26.3414
G01 X0.8337 Y26.4076
G01 X0.9097 Y26.4326
G01 X0.9844 Y26.4533
G01 X1.1748 Y26.5010
G01 X1.2529 Y26.5185
G01 X1.3293 Y26.5317
G01 X1.5235 Y26.5605
G01 X1.6004 Y26.5700
G01 X1.6802 Y26.5759
G01 X1.8762 Y26.5856
G01 X1.9150 Y26.5870
G01 X1.9550 Y26.5875
G01 X22.9550 Y26.5875
G01 X22.9950 Y26.5870
G01 X23.0338 Y26.5856
G01 X23.2298 Y26.5759
G01 X23.3096 Y26.5700
G01 X23.3865 Y26.5605
G01 X23.5807 Y26.5317
G01 X23.6571 Y26.5185
G01 X23.7352 Y26.5010
G01 X23.9256 Y26.4533
G01 X24.0003 Y26.4326
G01 X24.0763 Y26.4076
G01 X24.2611 Y26.3414
G01 X24.3357 Y26.3126
G01 X24.4066 Y26.2812
G01 X24.5840 Y26.1973
G01 X24.6555 Y26.1612
G01 X24.7229 Y26.1230
G01 X24.8913 Y26.0221
G01 X24.9588 Y25.9793
G01 X25.0222 Y25.9346
G01 X25.1799 Y25.8177
G01 X25.2429 Y25.7684
G01 X25.3016 Y25.7178
G01 X25.4471 Y25.5859
G01 X25.5050 Y25.5307
G01 X25.5584 Y25.4746
G01 X25.6903 Y25.3291
G01 X25.7425 Y25.2685
G01 X25.7902 Y25.2074
G01 X25.9071 Y25.0497
G01 X25.9531 Y24.9843
G01 X25.9946 Y24.9188
G01 X26.0955 Y24.7504
G01 X26.1349 Y24.6808
G01 X26.1698 Y24.6115
G01 X26.2537 Y24.4341
G01 X26.2860 Y24.3609
G01 X26.3139 Y24.2886
G01 X26.3801 Y24.1038
G01 X26.4051 Y24.0278
G01 X26.4258 Y23.9531
G01 X26.4735 Y23.7627
G01 X26.4910 Y23.6846
G01 X26.5042 Y23.6082
G01 X26.5330 Y23.4140
G01 X26.5425 Y23.3371
G01 X26.5484 Y23.2573
G01 X26.5581 Y23.0613
G01 X26.5595 Y23.0213
G01 X26.5600 Y22.9825
G01 X26.5600 Y1.9825
G01 X26.5595 Y1.9425
G01 X26.5581 Y1.9037
G01 X26.5484 Y1.7077
G01 X26.5425 Y1.6279
G01 X26.5330 Y1.5510
G01 X26.5042 Y1.3568
G01 X26.4910 Y1.2804
G01 X26.4735 Y1.2023
G01 X26.4258 Y1.0119
G01 X26.4051 Y0.9372
G01 X26.3801 Y0.8612
G01 X26.3139 Y0.6764
G01 X26.2851 Y0.6018
G01 X26.2537 Y0.5309
G01 X26.1698 Y0.3535
G01 X26.1337 Y0.2820
G01 X26.0955 Y0.2146
G01 X25.9946 Y0.0462
G01 X25.9518 Y-0.0213
G01 X25.9071 Y-0.0847
G01 X25.7902 Y-0.2424
G01 X25.7409 Y-0.3054
G01 X25.6903 Y-0.3641
G01 X25.5584 Y-0.5096
G01 X25.5032 Y-0.5675
G01 X25.4471 Y-0.6209
G01 X25.3016 Y-0.7528
G01 X25.2410 Y-0.8050
G01 X25.1799 Y-0.8527
G01 X25.0222 Y-0.9696
G01 X24.9568 Y-1.0156
G01 X24.8913 Y-1.0571
G01 X24.7229 Y-1.1580
G01 X24.6533 Y-1.1974
G01 X24.5840 Y-1.2323
G01 X24.4066 Y-1.3162
G01 X24.3334 Y-1.3485
G01 X24.2611 Y-1.3764
G01 X24.0763 Y-1.4426
G01 X24.0003 Y-1.4676
G01 X23.9256 Y-1.4883
G01 X23.7352 Y-1.5360
G01 X23.6571 Y-1.5535
G01 X23.5807 Y-1.5667
G01 X23.3865 Y-1.5955
G01 X23.3096 Y-1.6050
G01 X23.2298 Y-1.6109
G01 X23.0338 Y-1.6206
G01 X22.9938 Y-1.6220
G01 X22.9550 Y-1.6225
G01 X1.9550 Y-1.6225
G01 X1.9150 Y-1.6220
G01 X1.8762 Y-1.6206
G01 X1.6802 Y-1.6109
G01 X1.6004 Y-1.6050
G01 X1.5235 Y-1.5955
G01 X1.3293 Y-1.5667
G01 X1.2529 Y-1.5535
G01 X1.1748 Y-1.5360
G01 X0.9844 Y-1.4883
G01 X0.9097 Y-1.4676
G01 X0.8337 Y-1.4426
G01 X0.6489 Y-1.3764
G01 X0.5743 Y-1.3476
G01 X0.5034 Y-1.3162
G01 X0.3260 Y-1.2323
G01 X0.2545 Y-1.1962
G01 X0.1871 Y-1.1580
G01 X0.0187 Y-1.0571
G01 X-0.0488 Y-1.0143
G01 X-0.1122 Y-0.9696
G01 X-0.2699 Y-0.8527
G01 X-0.3329 Y-0.8034
G01 X-0.3916 Y-0.7528
G01 X-0.5371 Y-0.6209
G01 X-0.5950 Y-0.5657
G01 X-0.6484 Y-0.5096
G01 X-0.7803 Y-0.3641
G01 X-0.8325 Y-0.3035
G01 X-0.8802 Y-0.2424
G01 X-0.9971 Y-0.0847
G01 X-1.0431 Y-0.0193
G01 X-1.0846 Y0.0462
G01 X-1.1855 Y0.2146
G01 X-1.2249 Y0.2842
G01 X-1.2598 Y0.3535
G01 X-1.3437 Y0.5309
G01 X-1.3760 Y0.6041
G01 X-1.4039 Y0.6764
G01 X-1.4701 Y0.8612
G01 X-1.4951 Y0.9372
G01 X-1.5158 Y1.0119
G01 X-1.5635 Y1.2023
G01 X-1.5810 Y1.2804
G01 X-1.5942 Y1.3568
G01 X-1.6230 Y1.5510
G01 X-1.6327 Y1.6304
G01 X-1.6384 Y1.7077
G01 X-1.6481 Y1.9037
G01 X-1.6495 Y1.9425
G01 X-1.6500 Y1.9825
G01 X-1.6500 Y22.9825
G00 X-1.6500 Y22.9825
G01 F60.00
G01 Z-1.9000
G01 F500.00
G01 X-1.6500 Y1.9825
G01 X-1.6495 Y1.9425
G01 X-1.6481 Y1.9037
G01 X-1.6384 Y1.7077
G01 X-1.6327 Y1.6304
G01 X-1.6230 Y1.5510
G01 X-1.5942 Y1.3568
G01 X-1.5810 Y1.2804
G01 X-1.5635 Y1.2023
G01 X-1.5158 Y1.0119
G01 X-1.4951 Y0.9372
G01 X-1.4701 Y0.8612
G01 X-1.4039 Y0.6764
G01 X-1.3760 Y0.6041
G01 X-1.3437 Y0.5309
G01 X-1.2598 Y0.3535
G01 X-1.2249 Y0.2842
G01 X-1.1855 Y0.2146
G01 X-1.0846 Y0.0462
G01 X-1.0431 Y-0.0193
G01 X-0.9971 Y-0.0847
G01 X-0.8802 Y-0.2424
G01 X-0.8325 Y-0.3035
G01 X-0.7803 Y-0.3641
G01 X-0.6484 Y-0.5096
G01 X-0.5950 Y-0.5657
G01 X-0.5371 Y-0.6209
G01 X-0.3916 Y-0.7528
G01 X-0.3329 Y-0.8034
G01 X-0.2699 Y-0.8527
G01 X-0.1122 Y-0.9696
G01 X-0.0488 Y-1.0143
G01 X0.0187 Y-1.0571
G01 X0.1871 Y-1.1580
G01 X0.2545 Y-1.1962
G01 X0.3260 Y-1.2323
G01 X0.5034 Y-1.3162
G01 X0.5743 Y-1.3476
G01 X0.6489 Y-1.3764
G01 X0.8337 Y-1.4426
G01 X0.9097 Y-1.4676
G01 X0.9844 Y-1.4883
G01 X1.1748 Y-1.5360
G01 X1.2529 Y-1.5535
G01 X1.3293 Y-1.5667
G01 X1.5235 Y-1.5955
G01 X1.6004 Y-1.6050
G01 X1.6802 Y-1.6109
G01 X1.8762 Y-1.6206
G01 X1.9150 Y-1.6220
G01 X1.9550 Y-1.6225
G01 X22.9550 Y-1.6225
G01 X22.9938 Y-1.6220
G01 X23.0338 Y-1.6206
G01 X23.2298 Y-1.6109
G01 X23.3096 Y-1.6050
G01 X23.3865 Y-1.5955
G01 X23.5807 Y-1.5667
G01 X23.6571 Y-1.5535
G01 X23.7352 Y-1.5360
G01 X23.9256 Y-1.4883
G01 X24.0003 Y-1.4676
G01 X24.0763 Y-1.4426
G01 X24.2611 Y-1.3764
G01 X24.3334 Y-1.3485
G01 X24.4066 Y-1.3162
G01 X24.5840 Y-1.2323
G01 X24.6533 Y-1.1974
G01 X24.7229 Y-1.1580
G01 X24.8913 Y-1.0571
G01 X24.9568 Y-1.0156
G01 X25.0222 Y-0.9696
G01 X25.1799 Y-0.8527
G01 X25.2410 Y-0.8050
G01 X25.3016 Y-0.7528
G01 X25.4471 Y-0.6209
G01 X25.5032 Y-0.5675
G01 X25.5584 Y-0.5096
G01 X25.6903 Y-0.3641
G01 X25.7409 Y-0.3054
G01 X25.7902 Y-0.2424
G01 X25.9071 Y-0.0847
G01 X25.9518 Y-0.0213
G01 X25.9946 Y0.0462
G01 X26.0955 Y0.2146
G01 X26.1337 Y0.2820
G01 X26.1698 Y0.3535
G01 X26.2537 Y0.5309
G01 X26.2851 Y0.6018
G01 X26.3139 Y0.6764
G01 X26.3801 Y0.8612
G01 X26.4051 Y0.9372
G01 X26.4258 Y1.0119
G01 X26.4735 Y1.2023
G01 X26.4910 Y1.2804
G01 X26.5042 Y1.3568
G01 X26.5330 Y1.5510
G01 X26.5425 Y1.6279
G01 X26.5484 Y1.7077
G01 X26.5581 Y1.9037
G01 X26.5595 Y1.9425
G01 X26.5600 Y1.9825
G01 X26.5600 Y22.9825
G01 X26.5595 Y23.0213
G01 X26.5581 Y23.0613
G01 X26.5484 Y23.2573
G01 X26.5425 Y23.3371
G01 X26.5330 Y23.4140
G01 X26.5042 Y23.6082
G01 X26.4910 Y23.6846
G01 X26.4735 Y23.7627
G01 X26.4258 Y23.9531
G01 X26.4051 Y24.0278
G01 X26.3801 Y24.1038
G01 X26.3139 Y24.2886
G01 X26.2860 Y24.3609
G01 X26.2537 Y24.4341
G01 X26.1698 Y24.6115
G01 X26.1349 Y24.6808
G01 X26.0955 Y24.7504
G01 X25.9946 Y24.9188
G01 X25.9531 Y24.9843
G01 X25.9071 Y25.0497
G01 X25.7902 Y25.2074
G01 X25.7425 Y25.2685
G01 X25.6903 Y25.3291
G01 X25.5584 Y25.4746
G01 X25.5050 Y25.5307
G01 X25.4471 Y25.5859
G01 X25.3016 Y25.7178
G01 X25.2429 Y25.7684
G01 X25.1799 Y25.8177
G01 X25.0222 Y25.9346
G01 X24.9588 Y25.9793
G01 X24.8913 Y26.0221
G01 X24.7229 Y26.1230
G01 X24.6555 Y26.1612
G01 X24.5840 Y26.1973
G01 X24.4066 Y26.2812
G01 X24.3357 Y26.3126
G01 X24.2611 Y26.3414
G01 X24.0763 Y26.4076
G01 X24.0003 Y26.4326
G01 X23.9256 Y26.4533
G01 X23.7352 Y26.5010
G01 X23.6571 Y26.5185
G01 X23.5807 Y26.5317
G01 X23.3865 Y26.5605
G01 X23.3096 Y26.5700
G01 X23.2298 Y26.5759
G01 X23.0338 Y26.5856
G01 X22.9950 Y26.5870
G01 X22.9550 Y26.5875
G01 X1.9550 Y26.5875
G01 X1.9150 Y26.5870
G01 X1.8762 Y26.5856
G01 X1.6802 Y26.5759
G01 X1.6004 Y26.5700
G01 X1.5235 Y26.5605
G01 X1.3293 Y26.5317
G01 X1.2529 Y26.5185
G01 X1.1748 Y26.5010
G01 X0.9844 Y26.4533
G01 X0.9097 Y26.4326
G01 X0.8337 Y26.4076
G01 X0.6489 Y26.3414
G01 X0.5766 Y26.3135
G01 X0.5034 Y26.2812
G01 X0.3260 Y26.1973
G01 X0.2567 Y26.1624
G01 X0.1871 Y26.1230
G01 X0.0187 Y26.0221
G01 X-0.0468 Y25.9806
G01 X-0.1122 Y25.9346
G01 X-0.2699 Y25.8177
G01 X-0.3310 Y25.7700
G01 X-0.3916 Y25.7178
G01 X-0.5371 Y25.5859
G01 X-0.5932 Y25.5325
G01 X-0.6484 Y25.4746
G01 X-0.7803 Y25.3291
G01 X-0.8309 Y25.2704
G01 X-0.8802 Y25.2074
G01 X-0.9971 Y25.0497
G01 X-1.0418 Y24.9863
G01 X-1.0846 Y24.9188
G01 X-1.1855 Y24.7504
G01 X-1.2237 Y24.6830
G01 X-1.2598 Y24.6115
G01 X-1.3437 Y24.4341
G01 X-1.3751 Y24.3632
G01 X-1.4039 Y24.2886
G01 X-1.4701 Y24.1038
G01 X-1.4951 Y24.0278
G01 X-1.5158 Y23.9531
G01 X-1.5635 Y23.7627
G01 X-1.5810 Y23.6846
G01 X-1.5942 Y23.6082
G01 X-1.6230 Y23.4140
G01 X-1.6327 Y23.3346
G01 X-1.6384 Y23.2573
G01 X-1.6481 Y23.0613
G01 X-1.6500 Y22.9825
G00 Z1.0000
M05
G00 Z1.0000
G00 Z15.00


