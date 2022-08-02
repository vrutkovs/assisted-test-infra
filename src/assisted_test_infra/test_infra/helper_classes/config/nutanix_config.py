from abc import ABC
from dataclasses import dataclass

from assisted_test_infra.test_infra.helper_classes.config.controller_config import BaseNodeConfig


@dataclass
class BaseNutanixConfig(BaseNodeConfig, ABC):
    nutanix_prismcentral_address: str = None
    nutanix_prismcentral_port: str = None
    nutanix_prismcentral_username: str = None
    nutanix_prismcentral_password: str = None
    nutanix_prismelement_address: str = None
    nutanix_prismelement_port: str = None
    nutanix_prismelement_uuid: str = None
    nutanix_prismelement_name: str = None
    nutanix_subnet_uuid: str = None

    def __post_init__(self):
        super().__post_init__()
