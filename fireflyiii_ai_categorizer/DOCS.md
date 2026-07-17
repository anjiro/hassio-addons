# Firefly III AI Categorizer

Automatically categorizes [Firefly III](https://www.firefly-iii.org/) withdrawal
transactions using an LLM (OpenAI, Gemini, DeepSeek, or a locally hosted model
via Ollama). Wraps the upstream image published by
[ejagombar/FireflyIII-AI-Categorizer](https://github.com/ejagombar/FireflyIII-AI-Categorizer).

## Security warning

This application has **no built-in authentication**. Do not expose port 3000
outside your home network. This add-on intentionally does not enable Ingress,
since the app's static assets are not currently path-prefix aware and break
under HA's ingress proxy — keep it on your LAN/VLAN, or put your own
reverse-proxy with auth in front of it if you need remote access.

## First-time setup

1. Start the add-on and open `http://<home-assistant-host>:3000`. You'll land
   directly on the Settings page.
2. Under **Firefly III Connection**, enter your Firefly III instance URL and a
   Personal Access Token (create one in Firefly III under
   **Profile → OAuth → Personal Access Tokens**).
3. Under **AI Provider**, pick OpenAI, Gemini, DeepSeek, or a local
   OpenAI-compatible endpoint (e.g. Ollama at `http://<host>:11434/v1` with
   the API key left blank), and enter your API key.
4. Click **Test connection**, then **Save settings**. These are written to
   `/data/config.json` inside the addon's persistent volume and survive
   restarts and updates.
5. In Firefly III, go to **Automation → Webhooks → Create new webhook**, and
   set the URL to `http://<home-assistant-host>:3000/webhook`. New
   uncategorized withdrawals will now be classified automatically.

## Mass categorization

Use the **Jobs** tab's Batch Classification panel, or select transactions
individually on the **Transactions** tab, to (re-)categorize existing
transactions.

## Notes

- Transaction descriptions, destination names, and amounts are sent to
  whichever AI provider you configure. Use a local Ollama endpoint if you
  want to keep this data on-premises.
- All configuration lives in the app's own Settings UI, not in this add-on's
  Configuration tab — see `optional-native-options/` in the source repo if
  you'd rather set Firefly/AI credentials as Supervisor add-on options
  instead.
