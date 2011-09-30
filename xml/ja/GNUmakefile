
DOCS_JA =	ja/docs/introduction					\
		ja/docs/howto						\
		ja/docs/faq						\

DOCS_JA_XML =	$(foreach name, $(DOCS_JA), xml/$(name).xml)
DOCS_JA_HTML =	$(foreach name, $(DOCS_JA), $(OUT)/$(name).html)

INTRO_JA =	ja/docs/http/request_processing				\
		ja/docs/http/configuring_https_servers			\
		ja/docs/http/server_names				\

INTRO_JA_XML =	$(foreach name, $(INTRO_JA), xml/$(name).xml)
INTRO_JA_HTML =	$(foreach name, $(INTRO_JA), $(OUT)/$(name).html)

HOWTO_JA =	ja/docs/debugging_log					\
		ja/docs/http/converting_rewrite_rules			\

HOWTO_JA_XML =	$(foreach name, $(HOWTO_JA), xml/$(name).xml)
HOWTO_JA_HTML =	$(foreach name, $(HOWTO_JA), $(OUT)/$(name).html)

FAQ_JA =	ja/docs/sys_errlist					\

FAQ_JA_XML =	$(foreach name, $(FAQ_JA), xml/$(name).xml)
FAQ_JA_HTML =	$(foreach name, $(FAQ_JA), $(OUT)/$(name).html)

ja:									\
		$(OUT)/ja/index.html					\
		$(OUT)/ja/docs/index.html				\
		$(DOCS_JA_HTML)						\
		$(INTRO_JA_HTML)					\
		$(HOWTO_JA_HTML)					\
		$(FAQ_JA_HTML)						\

$(OUT)/ja/docs/introduction.html:					\
		xml/ja/docs/introduction.xml				\
		$(INTRO_JA_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)

$(OUT)/ja/docs/howto.html:						\
		xml/ja/docs/howto.xml					\
		$(HOWTO_JA_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)

$(OUT)/ja/docs/faq.html:						\
		xml/ja/docs/faq.xml					\
		$(FAQ_JA_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)
