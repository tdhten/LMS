function _change() {
	$("#vCode").attr("src", "/bookstore/VerifyCodeServlet?" + new Date().getTime());
}