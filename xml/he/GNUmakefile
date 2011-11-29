LANG =		he

DOCS =									\
		introduction						\
		howto							\
		windows							\

DOCS_XML =	$(foreach name, $(DOCS), xml/$(LANG)/docs/$(name).xml)
DOCS_HTML =	$(foreach name, $(DOCS), $(OUT)/$(LANG)/docs/$(name).html)

INTRO =									\
		http/server_names					\

INTRO_XML =	$(foreach name, $(INTRO), xml/$(LANG)/docs/$(name).xml)
INTRO_HTML =	$(foreach name, $(INTRO), $(OUT)/$(LANG)/docs/$(name).html)

HOWTO =									\
		http/converting_rewrite_rules				\

HOWTO_XML =	$(foreach name, $(HOWTO), xml/$(LANG)/docs/$(name).xml)
HOWTO_HTML =	$(foreach name, $(HOWTO), $(OUT)/$(LANG)/docs/$(name).html)

$(LANG):								\
		$(OUT)/$(LANG)/index.html				\
		$(OUT)/$(LANG)/docs/index.html				\
		$(DOCS_HTML)						\
		$(INTRO_HTML)						\
		$(HOWTO_HTML)						\

$(OUT)/$(LANG)/docs/index.html:						\
		$(DOCS_XML)						\

$(OUT)/$(LANG)/docs/introduction.html:					\
		$(INTRO_XML)						\

$(OUT)/$(LANG)/docs/howto.html:						\
		$(HOWTO_XML)						\
