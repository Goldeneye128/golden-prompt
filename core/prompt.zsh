# Prompt theme override loaded last to keep stable visual style.
setopt prompt_subst

# Keep git segment compact.
: "${ZSH_THEME_GIT_PROMPT_PREFIX="["}"
: "${ZSH_THEME_GIT_PROMPT_SUFFIX="] "}"
: "${ZSH_THEME_GIT_PROMPT_SEPARATOR="|"}"

# Requested style:
# - yellow: user@host
# - white: :
# - blue: path
# - cyan: prompt symbol
PROMPT='%F{yellow}%n@%m%f%F{white}:%f%F{blue}%(3~|%-1~/…/%2~|%3~)%f $(gitprompt)%F{cyan}❯%f '
