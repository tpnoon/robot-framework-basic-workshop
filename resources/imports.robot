*** Settings ***
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime
Library           OperatingSystem
Library           BuiltIn
Resource          ../keywords/common/common_keyword.robot
Variables         ../resources/configs/${env}/env_config.yaml