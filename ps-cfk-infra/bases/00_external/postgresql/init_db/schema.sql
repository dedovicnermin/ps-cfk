-- Table: public.accorgj

-- DROP TABLE IF EXISTS public.accorgj;

CREATE TABLE IF NOT EXISTS public.accorgj
(
    id_1158_01 bigint,
    accorgj_id bigint NOT NULL,
    cust_sls_accorj_nk bigint,
    sls_lot_accorj bigint,
    shipto_accorj_nk bigint,
    cust_sls_accorj bigint,
    shipto_accorj bigint,
    cust_acct_bs_num character varying(6) COLLATE pg_catalog."default",
    cust_acct_dest_num character varying(3) COLLATE pg_catalog."default",
    sls_cpstn_strt_dt date,
    sls_cpstn_end_dt date,
    sls_lot_prim_ind character varying(1) COLLATE pg_catalog."default",
    sls_lot_clas_cd character varying(4) COLLATE pg_catalog."default",
    sls_lot_id_num character varying(4) COLLATE pg_catalog."default",
    sls_cpstn_plan_cd character varying(4) COLLATE pg_catalog."default",
    sls_cpstn_shr_pct numeric(5,4),
    crea_dt timestamp without time zone,
    updt_dt timestamp without time zone,
    crea_by character varying(30) COLLATE pg_catalog."default",
    updt_by character varying(100) COLLATE pg_catalog."default",
    data_src character varying(10) COLLATE pg_catalog."default",
    ctry_cd character varying(10) COLLATE pg_catalog."default",
    operation character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT c_accorgj_pk PRIMARY KEY (accorgj_id)
)

TABLESPACE pg_default;


-- Table: public.addr

-- DROP TABLE IF EXISTS public.addr;

CREATE TABLE IF NOT EXISTS public.addr
(
    addr_id bigint NOT NULL,
    cust_acct_addr_nk bigint,
    rcmd_addr_nk bigint,
    rvw_addr_nk bigint,
    cust_acct_addr bigint,
    rvw_addr bigint,
    addr_key smallint,
    modf_cust_addr character varying(1) COLLATE pg_catalog."default",
    addr_ln_2 character varying(25) COLLATE pg_catalog."default",
    addr_ln_3 character varying(25) COLLATE pg_catalog."default",
    addr_ln_4 character varying(25) COLLATE pg_catalog."default",
    city character varying(16) COLLATE pg_catalog."default",
    state character varying(2) COLLATE pg_catalog."default",
    zip_cd_frst_5 character varying(5) COLLATE pg_catalog."default",
    zip_cd_last_4 character varying(4) COLLATE pg_catalog."default",
    dt_etry_crea date,
    dt_etry_updt date,
    anlt character varying(8) COLLATE pg_catalog."default",
    dt_addr_rvw_xmit date,
    dt_addr_rvw_rtn date,
    anlt_addr_rvw character varying(8) COLLATE pg_catalog."default",
    addr_clas_cd character varying(1) COLLATE pg_catalog."default",
    addr_aud_err_cd_2 character varying(3) COLLATE pg_catalog."default",
    aud_addr_ovrd_ind character varying(1) COLLATE pg_catalog."default",
    cust_addr_cass_id_1 character varying(10) COLLATE pg_catalog."default",
    cust_addr_cass_id_2 character varying(10) COLLATE pg_catalog."default",
    crea_dt timestamp without time zone,
    updt_dt timestamp without time zone,
    crea_by character varying(30) COLLATE pg_catalog."default",
    updt_by character varying(100) COLLATE pg_catalog."default",
    data_src character varying(10) COLLATE pg_catalog."default",
    ctry_cd character varying(10) COLLATE pg_catalog."default",
    operation character varying(50) COLLATE pg_catalog."default",
    addr_ln_5 character varying(29) COLLATE pg_catalog."default",
    filler_1 character varying(1) COLLATE pg_catalog."default",
    CONSTRAINT c_addr_pk PRIMARY KEY (addr_id)
)

TABLESPACE pg_default;



-- Table: public.billto

-- DROP TABLE IF EXISTS public.billto;

CREATE TABLE IF NOT EXISTS public.billto
(
    billto_id bigint NOT NULL,
    billto_kwd_custj_nk bigint,
    cust_acct_billto_nk bigint,
    billto_shipto_nk bigint,
    cust_acct_billto bigint,
    billto_cust_key smallint,
    addr_key smallint,
    cust_nm_ds_ln_1 character varying(25) COLLATE pg_catalog."default",
    cust_nm_ds_ln_2 character varying(25) COLLATE pg_catalog."default",
    cust_addr_attn character varying(25) COLLATE pg_catalog."default",
    cust_ctry_cd character varying(3) COLLATE pg_catalog."default",
    phn_nbr character varying(15) COLLATE pg_catalog."default",
    fax character varying(12) COLLATE pg_catalog."default",
    dt_etry_crea date,
    invc_ebpp_ind character varying(1) COLLATE pg_catalog."default",
    bill_srvc_chrg_ind character varying(1) COLLATE pg_catalog."default",
    invc_trms_cd character varying(2) COLLATE pg_catalog."default",
    invc_stmt_type_cd character varying(1) COLLATE pg_catalog."default",
    dt_etry_updt date,
    rstrct_pty_list_ind character varying(1) COLLATE pg_catalog."default",
    invc_copies_ct smallint,
    invc_cycl_day_one_dt character varying(2) COLLATE pg_catalog."default",
    invc_cycl_day_two_dt character varying(2) COLLATE pg_catalog."default",
    invc_nbr_cd_gnr character varying(3) COLLATE pg_catalog."default",
    invc_doc_cd_gnr character varying(3) COLLATE pg_catalog."default",
    invc_edi_cd character varying(1) COLLATE pg_catalog."default",
    invc_bil_rpt_ind character varying(1) COLLATE pg_catalog."default",
    invc_prnt_paper_ind character varying(1) COLLATE pg_catalog."default",
    invc_bill_tape_ind character varying(1) COLLATE pg_catalog."default",
    invc_hndl_cd character varying(3) COLLATE pg_catalog."default",
    misc_prnt_chrg_ind character varying(1) COLLATE pg_catalog."default",
    disc_on_prnt_ind character varying(1) COLLATE pg_catalog."default",
    cust_addr_updt_dt date,
    cust_rvw_dt date,
    crea_dt timestamp without time zone,
    updt_dt timestamp without time zone,
    crea_by character varying(30) COLLATE pg_catalog."default",
    updt_by character varying(100) COLLATE pg_catalog."default",
    data_src character varying(10) COLLATE pg_catalog."default",
    ctry_cd character varying(10) COLLATE pg_catalog."default",
    operation character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT c_billto_pk PRIMARY KEY (billto_id)
)

TABLESPACE pg_default;




-- Table: public.caller

-- DROP TABLE IF EXISTS public.caller;

CREATE TABLE IF NOT EXISTS public.caller
(
    dup_calcn_seq bigint,
    id_1294_01 bigint,
    id_1294_02 bigint,
    id_1294_03 bigint,
    caller_id bigint NOT NULL,
    phn_nbr character varying(20) COLLATE pg_catalog."default",
    cust_ctry_cd character varying(5) COLLATE pg_catalog."default",
    nbr_cust_phn_extn character varying(5) COLLATE pg_catalog."default",
    ctac_titl character varying(3) COLLATE pg_catalog."default",
    last_nm character varying(20) COLLATE pg_catalog."default",
    first_nm character varying(15) COLLATE pg_catalog."default",
    area_fax_cd character varying(3) COLLATE pg_catalog."default",
    fax_phn_exch character varying(3) COLLATE pg_catalog."default",
    fax_phn_extn character varying(4) COLLATE pg_catalog."default",
    ctry_fax_cd character varying(5) COLLATE pg_catalog."default",
    dt_etry_crea date,
    dt_etry_updt date,
    anlt character varying(8) COLLATE pg_catalog."default",
    cr_acct_nbr character varying(20) COLLATE pg_catalog."default",
    crd_type_cd character varying(1) COLLATE pg_catalog."default",
    tkn_id_cd character varying(1) COLLATE pg_catalog."default",
    cr_acct_expry_dt character varying(6) COLLATE pg_catalog."default",
    cr_pmt_cd character varying(1) COLLATE pg_catalog."default",
    email_addr character varying(80) COLLATE pg_catalog."default",
    shipt_email_ind character varying(1) COLLATE pg_catalog."default",
    invc_email_ind character varying(1) COLLATE pg_catalog."default",
    shipt_bo_email_ind character varying(1) COLLATE pg_catalog."default",
    cust_notfn_pfrc_cd character varying(1) COLLATE pg_catalog."default",
    ord_email_ackt_ind character varying(1) COLLATE pg_catalog."default",
    lic_nbr_id character varying(15) COLLATE pg_catalog."default",
    lic_st_id character varying(2) COLLATE pg_catalog."default",
    lic_dt_expry date,
    callr_vald_id character varying(1) COLLATE pg_catalog."default",
    callr_exmt_id character varying(1) COLLATE pg_catalog."default",
    crea_dt timestamp without time zone,
    updt_dt timestamp without time zone,
    crea_by character varying(30) COLLATE pg_catalog."default",
    updt_by character varying(100) COLLATE pg_catalog."default",
    data_src character varying(10) COLLATE pg_catalog."default",
    ctry_cd character varying(10) COLLATE pg_catalog."default",
    operation character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT c_caller_pk PRIMARY KEY (caller_id)
)

TABLESPACE pg_default;

