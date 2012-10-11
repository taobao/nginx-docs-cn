DOC_LANG =	cn

DOCS =									\
		faq							\
		windows							\
		syntax							\
		dirindex						\
		http/request_processing					\
		http/server_names					\
		http/configuring_https_servers				\
		debugging_log						\
		http/converting_rewrite_rules				\

DOCS_XML =	$(foreach name, $(DOCS), xml/$(DOC_LANG)/docs/$(name).xml)
DOCS_HTML =	$(foreach name, $(DOCS), $(OUT)/$(DOC_LANG)/docs/$(name).html)

FAQ =									\
		welcome_nginx_facebook					\
		sys_errlist						\

FAQ_XML =	$(foreach name, $(FAQ), xml/$(DOC_LANG)/docs/$(name).xml)
FAQ_HTML =	$(foreach name, $(FAQ), $(OUT)/$(DOC_LANG)/docs/$(name).html)

REFS =									\
		http/ngx_http_access_module				\
		http/ngx_http_addition_module				\
		http/ngx_http_auth_basic_module				\
		http/ngx_http_autoindex_module				\
		http/ngx_http_browser_module				\
		http/ngx_http_gzip_static_module			\
		http/ngx_http_index_module				\
		http/ngx_http_limit_conn_module				\

REFS_XML =	$(foreach name, $(REFS), xml/$(DOC_LANG)/docs/$(name).xml)
REFS_HTML =	$(foreach name, $(REFS), $(OUT)/$(DOC_LANG)/docs/$(name).html)

$(DOC_LANG):								\
		$(OUT)/$(DOC_LANG)/index.html				\
		$(OUT)/$(DOC_LANG)/docs/index.html			\
		$(DOCS_HTML)						\
		$(REFS_HTML)						\
		$(FAQ_HTML)						\

$(OUT)/$(DOC_LANG)/docs/index.html:					\
		$(DOCS_XML)						\
		$(REFS_XML)						\

xml/$(DOC_LANG)/docs/dirindex.xml:					\
		$(REFS_XML)						\
		xslt/dirindex.xslt
	echo "<modules>$(patsubst %,					\
	<module name=\"%\"/>, $(filter %.xml,$^))</modules>" |		\
	xsltproc -o -							\
	--stringparam LANG $(patsubst xml/%/docs/dirindex.xml,%,$@)	\
	xslt/dirindex.xslt - |						\
	sed 's;xml/[^/]*/docs/;;g' > $@

$(OUT)/$(DOC_LANG)/docs/faq.html:					\
		$(FAQ_XML)						\
