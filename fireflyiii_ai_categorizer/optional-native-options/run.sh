#!/usr/bin/with-contenv bashio
set -e

export FIREFLY_URL=$(bashio::config 'firefly_url')
export FIREFLY_PERSONAL_TOKEN=$(bashio::config 'firefly_token')
export AI_PROVIDER=$(bashio::config 'ai_provider')

if bashio::config.has_value 'openai_api_key'; then
  export OPENAI_API_KEY=$(bashio::config 'openai_api_key')
  export OPENAI_MODEL=$(bashio::config 'openai_model')
  bashio::config.has_value 'openai_base_url' && export OPENAI_BASE_URL=$(bashio::config 'openai_base_url')
fi

if bashio::config.has_value 'gemini_api_key'; then
  export GEMINI_API_KEY=$(bashio::config 'gemini_api_key')
  export GEMINI_MODEL=$(bashio::config 'gemini_model')
fi

if bashio::config.has_value 'deepseek_api_key'; then
  export DEEPSEEK_API_KEY=$(bashio::config 'deepseek_api_key')
  export DEEPSEEK_MODEL=$(bashio::config 'deepseek_model')
fi

bashio::log.info "Starting Firefly III AI Categorizer..."
exec /app/firefly-ai-categorize
