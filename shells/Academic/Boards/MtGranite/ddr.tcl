if {[getShellParam use_ddr] == 1} {
	set use_second_dimm [getShellParam use_second_dimm]

	# DDR3 (DIMM 0)
	set_location_assignment PIN_AH11 -to mem_0_a[0]
	set_location_assignment PIN_AF6 -to mem_0_a[1]
	set_location_assignment PIN_AC8 -to mem_0_a[2]
	set_location_assignment PIN_AD6 -to mem_0_a[3]
	set_location_assignment PIN_AG6 -to mem_0_a[4]
	set_location_assignment PIN_AD8 -to mem_0_a[5]
	set_location_assignment PIN_AC6 -to mem_0_a[6]
	set_location_assignment PIN_AL14 -to mem_0_a[7]
	set_location_assignment PIN_AA8 -to mem_0_a[8]
	set_location_assignment PIN_AN18 -to mem_0_a[9]
	set_location_assignment PIN_U9 -to mem_0_a[10]
	set_location_assignment PIN_AN21 -to mem_0_a[11]
	set_location_assignment PIN_AH13 -to mem_0_a[12]
	set_location_assignment PIN_AP7 -to mem_0_a[13]
	set_location_assignment PIN_AB9 -to mem_0_a[14]
	set_location_assignment PIN_W10 -to mem_0_a[15]
	set_location_assignment PIN_AD7 -to mem_0_ba[0]
	set_location_assignment PIN_R10 -to mem_0_ba[1]
	set_location_assignment PIN_AA9 -to mem_0_ba[2]
	set_location_assignment PIN_AA15 -to mem_0_cas_n[0]
	set_location_assignment PIN_AK8 -to mem_0_ck[0]
	set_location_assignment PIN_AC9 -to mem_0_ck[1] 
	set_location_assignment PIN_AL8 -to mem_0_ck_n[0]
	set_location_assignment PIN_AD9 -to mem_0_ck_n[1] 
	set_location_assignment PIN_AF7 -to mem_0_cke[0]
	set_location_assignment PIN_AG7 -to mem_0_cke[1] 
	set_location_assignment PIN_W9 -to mem_0_cs_n[0]
	set_location_assignment PIN_V10 -to mem_0_cs_n[1] 
	set_location_assignment PIN_AE14 -to mem_0_dm[0]
	set_location_assignment PIN_AB11 -to mem_0_dm[1]
	set_location_assignment PIN_AJ14 -to mem_0_dm[2]
	set_location_assignment PIN_AJ15 -to mem_0_dm[3]
	set_location_assignment PIN_AG10 -to mem_0_dm[4]
	set_location_assignment PIN_AJ9 -to mem_0_dm[5]
	set_location_assignment PIN_AH12 -to mem_0_dm[6]
	set_location_assignment PIN_AC15 -to mem_0_dm[7]
	set_location_assignment PIN_Y16 -to mem_0_dm[8]
	set_location_assignment PIN_W12 -to mem_0_dq[0]
	set_location_assignment PIN_AD12 -to mem_0_dq[1]
	set_location_assignment PIN_U13 -to mem_0_dq[2]
	set_location_assignment PIN_Y12 -to mem_0_dq[3]
	set_location_assignment PIN_AB12 -to mem_0_dq[4]
	set_location_assignment PIN_AA12 -to mem_0_dq[5]
	set_location_assignment PIN_AE13 -to mem_0_dq[6]
	set_location_assignment PIN_U12 -to mem_0_dq[7]
	set_location_assignment PIN_AE11 -to mem_0_dq[8]
	set_location_assignment PIN_AE10 -to mem_0_dq[9]
	set_location_assignment PIN_Y11 -to mem_0_dq[10]
	set_location_assignment PIN_AB10 -to mem_0_dq[11]
	set_location_assignment PIN_U10 -to mem_0_dq[12]
	set_location_assignment PIN_U11 -to mem_0_dq[13]
	set_location_assignment PIN_AC11 -to mem_0_dq[14]
	set_location_assignment PIN_Y10 -to mem_0_dq[15]
	set_location_assignment PIN_AP12 -to mem_0_dq[16]
	set_location_assignment PIN_AN13 -to mem_0_dq[17]
	set_location_assignment PIN_AK12 -to mem_0_dq[18]
	set_location_assignment PIN_AK14 -to mem_0_dq[19]
	set_location_assignment PIN_AN12 -to mem_0_dq[20]
	set_location_assignment PIN_AM14 -to mem_0_dq[21]
	set_location_assignment PIN_AK13 -to mem_0_dq[22]
	set_location_assignment PIN_AP13 -to mem_0_dq[23]
	set_location_assignment PIN_AK16 -to mem_0_dq[24]
	set_location_assignment PIN_AP15 -to mem_0_dq[25]
	set_location_assignment PIN_AP16 -to mem_0_dq[26]
	set_location_assignment PIN_AN16 -to mem_0_dq[27]
	set_location_assignment PIN_AJ17 -to mem_0_dq[28]
	set_location_assignment PIN_AK15 -to mem_0_dq[29]
	set_location_assignment PIN_AN15 -to mem_0_dq[30]
	set_location_assignment PIN_AH17 -to mem_0_dq[31]
	set_location_assignment PIN_AJ11 -to mem_0_dq[32]
	set_location_assignment PIN_AG9 -to mem_0_dq[33]
	set_location_assignment PIN_AF9 -to mem_0_dq[34]
	set_location_assignment PIN_AF10 -to mem_0_dq[35]
	set_location_assignment PIN_AJ8 -to mem_0_dq[36]
	set_location_assignment PIN_AH10 -to mem_0_dq[37]
	set_location_assignment PIN_AH8 -to mem_0_dq[38]
	set_location_assignment PIN_AH9 -to mem_0_dq[39]
	set_location_assignment PIN_AP10 -to mem_0_dq[40]
	set_location_assignment PIN_AL11 -to mem_0_dq[41]
	set_location_assignment PIN_AM11 -to mem_0_dq[42]
	set_location_assignment PIN_AP9 -to mem_0_dq[43]
	set_location_assignment PIN_AK11 -to mem_0_dq[44]
	set_location_assignment PIN_AN9 -to mem_0_dq[45]
	set_location_assignment PIN_AN10 -to mem_0_dq[46]
	set_location_assignment PIN_AK9 -to mem_0_dq[47]
	set_location_assignment PIN_AF14 -to mem_0_dq[48]
	set_location_assignment PIN_AF12 -to mem_0_dq[49]
	set_location_assignment PIN_AH15 -to mem_0_dq[50]
	set_location_assignment PIN_AF13 -to mem_0_dq[51]
	set_location_assignment PIN_AJ12 -to mem_0_dq[52]
	set_location_assignment PIN_AF15 -to mem_0_dq[53]
	set_location_assignment PIN_AH14 -to mem_0_dq[54]
	set_location_assignment PIN_AG13 -to mem_0_dq[55]
	set_location_assignment PIN_V13 -to mem_0_dq[56]
	set_location_assignment PIN_AC14 -to mem_0_dq[57]
	set_location_assignment PIN_AD14 -to mem_0_dq[58]
	set_location_assignment PIN_W13 -to mem_0_dq[59]
	set_location_assignment PIN_AB15 -to mem_0_dq[60]
	set_location_assignment PIN_W14 -to mem_0_dq[61]
	set_location_assignment PIN_Y14 -to mem_0_dq[62]
	set_location_assignment PIN_AD15 -to mem_0_dq[63]
	set_location_assignment PIN_W15 -to mem_0_dq[64]
	set_location_assignment PIN_W16 -to mem_0_dq[65]
	set_location_assignment PIN_AG16 -to mem_0_dq[66]
	set_location_assignment PIN_W17 -to mem_0_dq[67]
	set_location_assignment PIN_AE16 -to mem_0_dq[68]
	set_location_assignment PIN_AG15 -to mem_0_dq[69]
	set_location_assignment PIN_AD17 -to mem_0_dq[70]
	set_location_assignment PIN_AD16 -to mem_0_dq[71]
	set_location_assignment PIN_AA13 -to mem_0_dqs[0]
	set_location_assignment PIN_V11 -to mem_0_dqs[1]
	set_location_assignment PIN_AL13 -to mem_0_dqs[2]
	set_location_assignment PIN_AM16 -to mem_0_dqs[3]
	set_location_assignment PIN_AE8 -to mem_0_dqs[4]
	set_location_assignment PIN_AL10 -to mem_0_dqs[5]
	set_location_assignment PIN_AG12 -to mem_0_dqs[6]
	set_location_assignment PIN_AA14 -to mem_0_dqs[7]
	set_location_assignment PIN_AF16 -to mem_0_dqs[8]
	set_location_assignment PIN_AB13 -to mem_0_dqs_n[0]
	set_location_assignment PIN_W11 -to mem_0_dqs_n[1]
	set_location_assignment PIN_AM13 -to mem_0_dqs_n[2]
	set_location_assignment PIN_AL16 -to mem_0_dqs_n[3]
	set_location_assignment PIN_AF8 -to mem_0_dqs_n[4]
	set_location_assignment PIN_AM10 -to mem_0_dqs_n[5]
	set_location_assignment PIN_AF11 -to mem_0_dqs_n[6]
	set_location_assignment PIN_AB14 -to mem_0_dqs_n[7]
	set_location_assignment PIN_AF17 -to mem_0_dqs_n[8]
	set_location_assignment PIN_AD11 -to mem_0_odt[0]
	set_location_assignment PIN_Y9 -to mem_0_odt[1] 
	set_location_assignment PIN_AM5 -to mem_0_ras_n[0]
	set_location_assignment PIN_AB6 -to mem_0_reset_n
	set_location_assignment PIN_AC12 -to mem_0_we_n[0]

	if {$use_second_dimm == 1} {
		set_location_assignment PIN_AK23 -to mem_1_a[0]
		set_location_assignment PIN_AM28 -to mem_1_a[1]
		set_location_assignment PIN_AK27 -to mem_1_a[2]
		set_location_assignment PIN_AH16 -to mem_1_a[3]
		set_location_assignment PIN_AL25 -to mem_1_a[4]
		set_location_assignment PIN_AM26 -to mem_1_a[5]
		set_location_assignment PIN_AJ26 -to mem_1_a[6]
		set_location_assignment PIN_AC17 -to mem_1_a[7]
		set_location_assignment PIN_AM23 -to mem_1_a[8]
		set_location_assignment PIN_AM25 -to mem_1_a[9]
		set_location_assignment PIN_AK28 -to mem_1_a[11]
		set_location_assignment PIN_AK10 -to mem_1_a[12]
		set_location_assignment PIN_AJ23 -to mem_1_a[13]
		set_location_assignment PIN_AD28 -to mem_1_a[14]
		set_location_assignment PIN_AL23 -to mem_1_a[15]
		set_location_assignment PIN_AH26 -to mem_1_a[10]
		set_location_assignment PIN_AK25 -to mem_1_ck[1] 
		set_location_assignment PIN_AK24 -to mem_1_ck_n[1] 
		set_location_assignment PIN_AE23 -to mem_1_ba[0]
		set_location_assignment PIN_AE26 -to mem_1_ba[1]
		set_location_assignment PIN_AJ27 -to mem_1_ba[2]
		set_location_assignment PIN_AM30 -to mem_1_cas_n[0]
		set_location_assignment PIN_AH24 -to mem_1_ck[0]
		set_location_assignment PIN_AJ24 -to mem_1_ck_n[0]
		set_location_assignment PIN_W21 -to mem_1_cke[0]
		set_location_assignment PIN_W19 -to mem_1_cke[1] 
		set_location_assignment PIN_AP28 -to mem_1_cs_n[0]
		set_location_assignment PIN_AD29 -to mem_1_cs_n[1] 
		set_location_assignment PIN_Y17 -to mem_1_dm[0]
		set_location_assignment PIN_AL19 -to mem_1_dm[1]
		set_location_assignment PIN_AN22 -to mem_1_dm[2]
		set_location_assignment PIN_Y21 -to mem_1_dm[3]
		set_location_assignment PIN_AH22 -to mem_1_dm[4]
		set_location_assignment PIN_W22 -to mem_1_dm[5]
		set_location_assignment PIN_U26 -to mem_1_dm[6]
		set_location_assignment PIN_T25 -to mem_1_dm[7]
		set_location_assignment PIN_AC26 -to mem_1_dm[8]
		set_location_assignment PIN_AA18 -to mem_1_dq[0]
		set_location_assignment PIN_AG18 -to mem_1_dq[1]
		set_location_assignment PIN_AE19 -to mem_1_dq[2]
		set_location_assignment PIN_Y19 -to mem_1_dq[3]
		set_location_assignment PIN_AF18 -to mem_1_dq[4]
		set_location_assignment PIN_AF19 -to mem_1_dq[5]
		set_location_assignment PIN_Y18 -to mem_1_dq[6]
		set_location_assignment PIN_W18 -to mem_1_dq[7]
		set_location_assignment PIN_AP18 -to mem_1_dq[8]
		set_location_assignment PIN_AH18 -to mem_1_dq[9]
		set_location_assignment PIN_AL17 -to mem_1_dq[10]
		set_location_assignment PIN_AM17 -to mem_1_dq[11]
		set_location_assignment PIN_AJ18 -to mem_1_dq[12]
		set_location_assignment PIN_AM18 -to mem_1_dq[13]
		set_location_assignment PIN_AG19 -to mem_1_dq[14]
		set_location_assignment PIN_AK19 -to mem_1_dq[15]
		set_location_assignment PIN_AM22 -to mem_1_dq[16]
		set_location_assignment PIN_AK22 -to mem_1_dq[17]
		set_location_assignment PIN_AM20 -to mem_1_dq[18]
		set_location_assignment PIN_AM19 -to mem_1_dq[19]
		set_location_assignment PIN_AL22 -to mem_1_dq[20]
		set_location_assignment PIN_AP22 -to mem_1_dq[21]
		set_location_assignment PIN_AK21 -to mem_1_dq[22]
		set_location_assignment PIN_AP21 -to mem_1_dq[23]
		set_location_assignment PIN_AD20 -to mem_1_dq[24]
		set_location_assignment PIN_AF20 -to mem_1_dq[25]
		set_location_assignment PIN_W20 -to mem_1_dq[26]
		set_location_assignment PIN_AF21 -to mem_1_dq[27]
		set_location_assignment PIN_AE20 -to mem_1_dq[28]
		set_location_assignment PIN_AB20 -to mem_1_dq[29]
		set_location_assignment PIN_AA20 -to mem_1_dq[30]
		set_location_assignment PIN_AA21 -to mem_1_dq[31]
		set_location_assignment PIN_AH20 -to mem_1_dq[32]
		set_location_assignment PIN_AF22 -to mem_1_dq[33]
		set_location_assignment PIN_AG22 -to mem_1_dq[34]
		set_location_assignment PIN_AJ21 -to mem_1_dq[35]
		set_location_assignment PIN_AH23 -to mem_1_dq[36]
		set_location_assignment PIN_AJ20 -to mem_1_dq[37]
		set_location_assignment PIN_AK20 -to mem_1_dq[38]
		set_location_assignment PIN_AF23 -to mem_1_dq[39]
		set_location_assignment PIN_AD22 -to mem_1_dq[40]
		set_location_assignment PIN_AD23 -to mem_1_dq[41]
		set_location_assignment PIN_AC23 -to mem_1_dq[42]
		set_location_assignment PIN_Y23 -to mem_1_dq[43]
		set_location_assignment PIN_Y22 -to mem_1_dq[44]
		set_location_assignment PIN_AE22 -to mem_1_dq[45]
		set_location_assignment PIN_V22 -to mem_1_dq[46]
		set_location_assignment PIN_AA22 -to mem_1_dq[47]
		set_location_assignment PIN_AB23 -to mem_1_dq[48]
		set_location_assignment PIN_W25 -to mem_1_dq[49]
		set_location_assignment PIN_AB24 -to mem_1_dq[50]
		set_location_assignment PIN_Y26 -to mem_1_dq[51]
		set_location_assignment PIN_U25 -to mem_1_dq[52]
		set_location_assignment PIN_V25 -to mem_1_dq[53]
		set_location_assignment PIN_AA27 -to mem_1_dq[54]
		set_location_assignment PIN_Y25 -to mem_1_dq[55]
		set_location_assignment PIN_N23 -to mem_1_dq[56]
		set_location_assignment PIN_N24 -to mem_1_dq[57]
		set_location_assignment PIN_AA24 -to mem_1_dq[58]
		set_location_assignment PIN_T23 -to mem_1_dq[59]
		set_location_assignment PIN_V24 -to mem_1_dq[60]
		set_location_assignment PIN_W24 -to mem_1_dq[61]
		set_location_assignment PIN_R26 -to mem_1_dq[62]
		set_location_assignment PIN_Y24 -to mem_1_dq[63]
		set_location_assignment PIN_AC24 -to mem_1_dq[64]
		set_location_assignment PIN_AF24 -to mem_1_dq[65]
		set_location_assignment PIN_AF26 -to mem_1_dq[66]
		set_location_assignment PIN_AE25 -to mem_1_dq[67]
		set_location_assignment PIN_AG24 -to mem_1_dq[68]
		set_location_assignment PIN_AD26 -to mem_1_dq[69]
		set_location_assignment PIN_AF25 -to mem_1_dq[70]
		set_location_assignment PIN_AD24 -to mem_1_dq[71]
		set_location_assignment PIN_AB18 -to mem_1_dqs[0]
		set_location_assignment PIN_AK17 -to mem_1_dqs[1]
		set_location_assignment PIN_AN19 -to mem_1_dqs[2]
		set_location_assignment PIN_AC20 -to mem_1_dqs[3]
		set_location_assignment PIN_AG21 -to mem_1_dqs[4]
		set_location_assignment PIN_AB21 -to mem_1_dqs[5]
		set_location_assignment PIN_AA25 -to mem_1_dqs[6]
		set_location_assignment PIN_U24 -to mem_1_dqs[7]
		set_location_assignment PIN_AG25 -to mem_1_dqs[8]
		set_location_assignment PIN_AB19 -to mem_1_dqs_n[0]
		set_location_assignment PIN_AK18 -to mem_1_dqs_n[1]
		set_location_assignment PIN_AP19 -to mem_1_dqs_n[2]
		set_location_assignment PIN_AC21 -to mem_1_dqs_n[3]
		set_location_assignment PIN_AH21 -to mem_1_dqs_n[4]
		set_location_assignment PIN_AB22 -to mem_1_dqs_n[5]
		set_location_assignment PIN_AB26 -to mem_1_dqs_n[6]
		set_location_assignment PIN_V23 -to mem_1_dqs_n[7]
		set_location_assignment PIN_AH25 -to mem_1_dqs_n[8]
		set_location_assignment PIN_AE28 -to mem_1_odt[0]
		set_location_assignment PIN_AH27 -to mem_1_odt[1] 
		set_location_assignment PIN_AN24 -to mem_1_ras_n[0]
		set_location_assignment PIN_AB7 -to mem_1_reset_n
		set_location_assignment PIN_AK26 -to mem_1_we_n[0]
	}

	########## DDR I/O Standards
	set_instance_assignment -name IO_STANDARD "SSTL-15" -to mem_0_rzq -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[9] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[9] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[9] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[10] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[10] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[10] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[11] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[11] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[11] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[12] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[12] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[12] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[13] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[13] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[13] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[14] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[14] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[14] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[15] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[15] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[15] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[16] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[16] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[16] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[17] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[17] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[17] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[18] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[18] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[18] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[19] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[19] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[19] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[20] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[20] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[20] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[21] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[21] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[21] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[22] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[22] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[22] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[23] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[23] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[23] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[24] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[24] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[24] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[25] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[25] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[25] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[26] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[26] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[26] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[27] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[27] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[27] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[28] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[28] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[28] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[29] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[29] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[29] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[30] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[30] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[30] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[31] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[31] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[31] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[32] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[32] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[32] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[33] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[33] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[33] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[34] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[34] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[34] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[35] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[35] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[35] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[36] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[36] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[36] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[37] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[37] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[37] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[38] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[38] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[38] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[39] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[39] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[39] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[40] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[40] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[40] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[41] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[41] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[41] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[42] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[42] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[42] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[43] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[43] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[43] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[44] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[44] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[44] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[45] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[45] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[45] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[46] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[46] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[46] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[47] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[47] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[47] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[48] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[48] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[48] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[49] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[49] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[49] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[50] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[50] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[50] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[51] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[51] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[51] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[52] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[52] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[52] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[53] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[53] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[53] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[54] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[54] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[54] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[55] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[55] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[55] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[56] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[56] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[56] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[57] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[57] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[57] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[58] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[58] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[58] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[59] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[59] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[59] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[60] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[60] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[60] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[61] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[61] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[61] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[62] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[62] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[62] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[63] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[63] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[63] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[64] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[64] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[64] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[65] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[65] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[65] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[66] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[66] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[66] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[67] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[67] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[67] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[68] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[68] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[68] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[69] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[69] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[69] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[70] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[70] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[70] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dq[71] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dq[71] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dq[71] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs_n[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs_n[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs_n[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs_n[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs_n[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs_n[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs_n[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_dqs_n[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dqs_n[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_ck[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_ck[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_ck[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_ck[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_ck_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_ck_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_0_ck_n[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_ck_n[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[10] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[10] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[11] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[11] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[12] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[12] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[13] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[13] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[14] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[14] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[15] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[15] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_a[9] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_a[9] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_ba[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_ba[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_ba[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_ba[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_ba[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_ba[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_cs_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_cs_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_cs_n[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_cs_n[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_we_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_we_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_ras_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_ras_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_cas_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_cas_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_cke[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_cke[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_cke[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_cke[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_odt[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_odt[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_odt[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_odt[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD 1.5V -to mem_0_reset_n -tag __ddr3_dimm0_p0
	set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_0_reset_n -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dm[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dm[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dm[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dm[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dm[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dm[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dm[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dm[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dm[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dm[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dm[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dm[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dm[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dm[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dm[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dm[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_0_dm[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_0_dm[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name IO_STANDARD "SSTL-15" -to mem_0_refclk -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[9] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[10] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[11] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[12] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[13] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[14] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[15] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[16] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[17] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[18] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[19] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[20] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[21] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[22] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[23] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[24] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[25] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[26] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[27] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[28] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[29] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[30] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[31] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[32] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[33] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[34] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[35] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[36] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[37] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[38] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[39] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[40] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[41] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[42] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[43] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[44] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[45] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[46] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[47] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[48] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[49] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[50] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[51] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[52] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[53] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[54] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[55] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[56] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[57] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[58] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[59] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[60] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[61] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[62] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[63] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[64] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[65] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[66] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[67] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[68] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[69] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[70] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dq[71] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dm[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dm[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dm[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dm[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dm[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dm[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dm[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dm[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dm[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs_n[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs_n[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs_n[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs_n[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs_n[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs_n[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs_n[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_dqs_n[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[10] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[11] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[12] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[13] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[14] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[15] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[3] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[4] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[5] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[6] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[7] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[8] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_a[9] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_ba[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_ba[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_ba[2] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_cs_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_cs_n[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_we_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_ras_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_cas_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_cke[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_cke[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_odt[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_odt[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_reset_n -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_ck[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_ck[1] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_ck_n[0] -tag __ddr3_dimm0_p0
	set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_0_ck_n[1] -tag __ddr3_dimm0_p0

	if {$use_second_dimm == 1} {
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[9] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[9] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[9] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[10] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[10] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[10] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[11] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[11] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[11] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[12] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[12] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[12] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[13] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[13] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[13] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[14] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[14] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[14] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[15] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[15] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[15] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[16] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[16] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[16] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[17] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[17] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[17] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[18] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[18] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[18] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[19] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[19] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[19] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[20] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[20] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[20] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[21] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[21] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[21] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[22] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[22] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[22] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[23] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[23] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[23] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[24] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[24] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[24] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[25] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[25] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[25] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[26] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[26] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[26] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[27] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[27] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[27] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[28] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[28] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[28] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[29] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[29] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[29] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[30] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[30] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[30] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[31] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[31] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[31] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[32] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[32] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[32] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[33] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[33] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[33] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[34] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[34] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[34] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[35] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[35] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[35] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[36] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[36] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[36] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[37] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[37] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[37] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[38] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[38] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[38] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[39] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[39] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[39] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[40] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[40] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[40] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[41] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[41] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[41] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[42] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[42] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[42] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[43] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[43] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[43] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[44] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[44] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[44] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[45] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[45] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[45] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[46] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[46] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[46] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[47] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[47] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[47] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[48] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[48] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[48] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[49] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[49] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[49] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[50] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[50] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[50] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[51] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[51] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[51] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[52] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[52] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[52] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[53] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[53] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[53] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[54] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[54] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[54] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[55] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[55] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[55] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[56] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[56] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[56] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[57] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[57] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[57] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[58] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[58] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[58] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[59] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[59] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[59] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[60] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[60] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[60] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[61] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[61] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[61] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[62] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[62] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[62] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[63] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[63] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[63] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[64] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[64] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[64] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[65] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[65] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[65] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[66] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[66] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[66] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[67] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[67] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[67] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[68] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[68] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[68] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[69] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[69] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[69] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[70] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[70] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[70] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dq[71] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dq[71] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dq[71] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs_n[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs_n[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs_n[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs_n[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs_n[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs_n[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs_n[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_dqs_n[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name INPUT_TERMINATION "PARALLEL 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dqs_n[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_ck[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_ck[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_ck[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_ck[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_ck_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_ck_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to mem_1_ck_n[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_ck_n[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[10] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[10] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[11] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[11] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[12] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[12] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[13] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[13] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[14] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[14] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[15] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[15] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_a[9] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_a[9] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_ba[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_ba[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_ba[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_ba[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_ba[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_ba[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_cs_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_cs_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_cs_n[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_cs_n[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_we_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_we_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_ras_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_ras_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_cas_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_cas_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_cke[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_cke[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_cke[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_cke[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_odt[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_odt[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_odt[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_odt[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD 1.5V -to mem_1_reset_n -tag __ddr3_dimm1_p0
		set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to mem_1_reset_n -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dm[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dm[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dm[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dm[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dm[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dm[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dm[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dm[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dm[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dm[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dm[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dm[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dm[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dm[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dm[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dm[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to mem_1_dm[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name OUTPUT_TERMINATION "SERIES 50 OHM WITH CALIBRATION" -to mem_1_dm[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[9] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[10] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[11] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[12] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[13] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[14] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[15] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[16] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[17] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[18] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[19] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[20] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[21] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[22] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[23] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[24] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[25] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[26] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[27] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[28] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[29] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[30] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[31] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[32] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[33] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[34] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[35] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[36] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[37] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[38] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[39] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[40] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[41] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[42] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[43] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[44] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[45] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[46] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[47] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[48] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[49] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[50] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[51] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[52] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[53] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[54] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[55] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[56] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[57] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[58] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[59] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[60] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[61] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[62] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[63] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[64] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[65] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[66] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[67] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[68] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[69] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[70] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dq[71] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dm[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dm[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dm[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dm[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dm[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dm[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dm[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dm[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dm[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs_n[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs_n[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs_n[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs_n[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs_n[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs_n[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs_n[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_dqs_n[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[10] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[11] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[12] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[13] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[14] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[15] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[3] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[4] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[5] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[6] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[7] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[8] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_a[9] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_ba[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_ba[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_ba[2] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_cs_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_cs_n[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_we_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_ras_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_cas_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_cke[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_cke[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_odt[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_odt[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_reset_n -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_ck[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_ck[1] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_ck_n[0] -tag __ddr3_dimm1_p0
		set_instance_assignment -name PACKAGE_SKEW_COMPENSATION ON -to mem_1_ck_n[1] -tag __ddr3_dimm1_p0
	}
}