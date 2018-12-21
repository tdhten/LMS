function _change() {
	$("#vCode").attr("src", "/bms/VerifyCodeServlet?" + new Date().getTime());
}