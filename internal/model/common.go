package model

type ResponseHeader struct {
	Success        bool    `json:"success"`
	ProcessingTime float64 `json:"processing_time"`
	ErrorCode      int     `json:"error_code"`
	ErrorMessage   string  `json:"error_message"`
}
