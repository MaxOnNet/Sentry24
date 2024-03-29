#!/usr/bin/env bash
# -*- coding: utf-8 -*-
#
# Copyright [2016] Tatarnikov Viktor [viktor@tatarnikov.org]
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Проверяем, присутствует ли отладочное окружение
path_python_env="/Users/v_tatarnikov/_python_env_sentry24";

if [ -x "${path_python_env}/bin/python" ]; then
    echo "USE Python path: ${path_python_env}";
    path_python="${path_python_env}/bin/python";
else
    path_python="$(which python)";
    path_python_env="/";
fi;

# Ищем путь до программы
for path in  "/Users/v_tatarnikov/PycharmProjects/Sentry24/" "/home/sentry24/"; do
    if [ -e "${path}sentry-sphinx-update.sh" ]; then
        echo "USE Sentry path: ${path}";
        cd ${path}/;

        PYTHONUNBUFFERED=1 LC_CTYPE=ru_RU.UTF-8 LC_ALL=ru_RU.UTF-8 LANG=ru_RU.UTF-8 LC_COLLATE=ru_RU.utf8 LC_MONETARY=ru_RU.utf8 PYTHONPATH=${PYTHONPATH}:${path} ${path_python_env}/bin/sphinx-build -b html -E -d ./share/sphinx/build/doctrees/ -j 1 -c ./share/sphinx/ ./ ./share/sphinx/build/html
        break;
    fi;
done;


