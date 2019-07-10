PROJECT = rabbitmq_db
PROJECT_DESCRIPTION = RabbitMQ Database Interfacing Plugin
PROJECT_MOD = 'Elixir.RabbitDB.Application'

define PROJECT_APP_EXTRA_KEYS
	{broker_version_requirements, []}
endef

DEPS = rabbit
# dep_ecto_sql = git https://github.com/elixir-ecto/ecto_sql.git v3.1.6
# dep_postgrex = git https://github.com/elixir-ecto/postgrex.git v0.14.3
# dep_amqp = git https://github.com/pma/amqp.git v1.2.2
# dep_jsx = git https://github.com/talentdeficit/jsx v2.10.0

LOCAL_DEPS = crypto

TEST_DEPS = rabbitmq_ct_helpers rabbitmq_ct_client_helpers rabbitmq_amqp1_0 meck

DEP_EARLY_PLUGINS = rabbit_common/mk/rabbitmq-early-plugin.mk
DEP_PLUGINS = rabbit_common/mk/rabbitmq-plugin.mk elvis_mk
dep_elvis_mk = git https://github.com/inaka/elvis.mk.git master


# FIXME: Use erlang.mk patched for RabbitMQ, while waiting for PRs to be
# reviewed and merged.

ERLANG_MK_REPO = https://github.com/rabbitmq/erlang.mk.git
ERLANG_MK_COMMIT = rabbitmq-tmp

include rabbitmq-components.mk
include erlang.mk
