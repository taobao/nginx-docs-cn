LANG =		tr

DOCS =									\
		introduction						\
		howto							\
		faq							\
		windows							\

DOCS_XML =	$(foreach name, $(DOCS), xml/$(LANG)/docs/$(name).xml)
DOCS_HTML =	$(foreach name, $(DOCS), $(OUT)/$(LANG)/docs/$(name).html)

INTRO =									\
		http/request_processing					\
		http/server_names					\
		http/configuring_https_servers				\

INTRO_XML =	$(foreach name, $(INTRO), xml/$(LANG)/docs/$(name).xml)
INTRO_HTML =	$(foreach name, $(INTRO), $(OUT)/$(LANG)/docs/$(name).html)

HOWTO =									\
		debugging_log						\
		http/converting_rewrite_rules				\

HOWTO_XML =	$(foreach name, $(HOWTO), xml/$(LANG)/docs/$(name).xml)
HOWTO_HTML =	$(foreach name, $(HOWTO), $(OUT)/$(LANG)/docs/$(name).html)

FAQ =									\
		sys_errlist						\

FAQ_XML =	$(foreach name, $(FAQ), xml/$(LANG)/docs/$(name).xml)
FAQ_HTML =	$(foreach name, $(FAQ), $(OUT)/$(LANG)/docs/$(name).html)

$(LANG):								\
		$(OUT)/$(LANG)/index.html				\
		$(OUT)/$(LANG)/docs/index.html				\
		$(DOCS_HTML)						\
		$(INTRO_HTML)						\
		$(HOWTO_HTML)						\
		$(FAQ_HTML)						\

$(OUT)/$(LANG)/docs/index.html:						\
		$(DOCS_XML)						\

$(OUT)/$(LANG)/docs/introduction.html:					\
		$(INTRO_XML)						\

$(OUT)/$(LANG)/docs/howto.html:						\
		$(HOWTO_XML)						\

$(OUT)/$(LANG)/docs/faq.html:						\
		$(FAQ_XML)						\
