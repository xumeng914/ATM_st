## loading input data
data_input <- read.table("D:\\R_project\\ATM_st\\20170412_ATM\\SDI_M_DATA_INPUT_ATM_BASE_INFO.csv",
                sep = ",",quote = ",",fileEncoding = "utf8")

data_input_col_name <- read.table("D:\\R_project\\ATM_st\\20170412_ATM\\SDI_M_DATA_INPUT_ATM_BASE_INFO_colname.csv",
                sep = ",",quote = ",",fileEncoding = "utf8")
colnames(data_input)<-data_input_col_name$V1
data_input<- subset(data_input,data_input$job_seq_id=="4845142")


## loading tmb
data_tmb <- read.table("D:\\R_project\\ATM_st\\20170412_ATM\\SDI_F_CORE_BWFMATMB.csv",
                         sep = ",",quote = ",",fileEncoding = "utf8")

data_tmb_col_name <- read.table("D:\\R_project\\ATM_st\\20170412_ATM\\SDI_F_CORE_BWFMATMB_colname.csv",
                                  sep = ",",quote = ",",fileEncoding = "utf8")
colnames(data_tmb)<-data_tmb_col_name$V1

