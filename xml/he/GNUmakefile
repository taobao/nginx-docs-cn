
DOCS_HE =	he/docs/windows						\
		he/docs/introduction					\
		he/docs/howto						\

DOCS_HE_XML =	$(foreach name, $(DOCS_HE), xml/$(name).xml)
DOCS_HE_HTML =	$(foreach name, $(DOCS_HE), $(OUT)/$(name).html)

INTRO_HE =	he/docs/http/server_names				\

INTRO_HE_XML =	$(foreach name, $(INTRO_HE), xml/$(name).xml)
INTRO_HE_HTML =	$(foreach name, $(INTRO_HE), $(OUT)/$(name).html)

HOWTO_HE =	he/docs/http/converting_rewrite_rules			\

HOWTO_HE_XML =	$(foreach name, $(HOWTO_HE), xml/$(name).xml)
HOWTO_HE_HTML =	$(foreach name, $(HOWTO_HE), $(OUT)/$(name).html)

he:									\
		$(OUT)/he/index.html					\
		$(OUT)/he/docs/index.html				\
		$(DOCS_HE_HTML)						\
		$(INTRO_HE_HTML)					\
		$(HOWTO_HE_HTML)					\

$(OUT)/he/docs/index.html:						\
		xml/he/docs/index.xml					\
		$(DOCS_HE_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)

$(OUT)/he/docs/introduction.html:					\
		xml/he/docs/introduction.xml				\
		$(INTRO_HE_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)

$(OUT)/he/docs/howto.html:						\
		xml/he/docs/howto.xml					\
		$(HOWTO_HE_XML)						\
		$(ARTICLE_DEPS)
	$(call XSLT, xslt/article.xslt, $<, $@)
