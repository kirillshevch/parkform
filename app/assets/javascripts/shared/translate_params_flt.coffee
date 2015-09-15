angular.module("app.shared").filter "translateParams", [ "$translate", ($translate) ->
  return (translation, params) ->
    if translation
      for key, val of params
        replace_with = val
        regExp = new RegExp("\%\{#{key}\}")
        translation = translation.replace(regExp, replace_with)
      translation
]
