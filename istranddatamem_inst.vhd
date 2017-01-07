istranddatamem_inst : istranddatamem PORT MAP(
		address	 => address_sig,
		inclock	 => inclock_sig,
		we	 => we_sig,
		data	 => data_sig,
		q	 => q_sig
	);
