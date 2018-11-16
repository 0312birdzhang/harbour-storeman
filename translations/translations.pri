CONFIG += \
    sailfishapp_i18n \
    sailfishapp_i18n_idbased \
    sailfishapp_i18n_unfinished

TRANSLATIONS += \
    translations/harbour-storeman-cn.ts \
    translations/harbour-storeman-cn-zh_CN.ts \
    translations/harbour-storeman-cn-da.ts \
    translations/harbour-storeman-cn-de_DE.ts \
    translations/harbour-storeman-cn-el.ts \
    translations/harbour-storeman-cn-es.ts \
    translations/harbour-storeman-cn-fi_FI.ts \
    translations/harbour-storeman-cn-fr.ts \
    translations/harbour-storeman-cn-hu_HU.ts \
    translations/harbour-storeman-cn-it.ts \
    translations/harbour-storeman-cn-nl.ts \
    translations/harbour-storeman-cn-nl_BE.ts \
    translations/harbour-storeman-cn-pl.ts \
    translations/harbour-storeman-cn-pt_BR.ts \
    translations/harbour-storeman-cn-ru.ts \
    translations/harbour-storeman-cn-sl_SI.ts \
    translations/harbour-storeman-cn-sv.ts

OTHER_FILES += \
    $$TRANSLATIONS \
    $$PWD/update_translations.py
