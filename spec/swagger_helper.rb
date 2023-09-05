# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'

  petTypeRequestBody = {
    type: 'object',
    properties: {
      label: {
        type: 'string',
        description: 'Pet Type'
      }
    },
    required: ['label'],
    example: {
      label: 'Dog'
    }
  };
  petTypeResponseBody = {
    type: 'object',
    properties: {
      _id: {
        type: 'string',
        description: 'Pet Type Id'
      },
      label: {
        type: 'string',
        description: 'Pet Type'
      },
      createDate: {
        type: 'string',
        description: 'Created Date'
      },
      updateDate: {
        type: 'string',
        description: 'Updated Date'
      },
      __v: {
        type: 'number',
        description: 'Version'
      }
    }
  };
  
  characterRequestBody = {
    type: 'object',
    properties: {
      label: {
        type: 'string',
        description: 'Character'
      }
    },
    required: ['label'],
    example: {
      label: 'Cute'
    }
  };
  characterResponseBody = {
    type: 'object',
    properties: {
      _id: {
        type: 'string',
        description: 'Character Id'
      },
      label: {
        type: 'string',
        description: 'Character'
      },
      createDate: {
        type: 'string',
        description: 'Created Date'
      },
      updateDate: {
        type: 'string',
        description: 'Updated Date'
      },
      __v: {
        type: 'number',
        description: 'Version'
      }
    }
  };
  
  petRequestBody = {
    type: 'object',
    properties: {
      name: {
        type: 'string',
        description: 'Pet Name'
      },
      age: {
        type: 'number',
        description: 'Pet Age'
      },
      petType: {
        type: 'string',
        description: 'Pet Type Id'
      },
      character: {
        type: 'string',
        description: 'Character Id'
      },
      about: {
        type: 'string',
        description: 'About Pet'
      },
      favorite: {
        type: 'string',
        description: 'Favorite'
      },
      image: {
        type: 'string',
        description: 'Image'
      },
      loveCount: {
        type: 'number',
        description: 'Love Count'
      }
    },
    required: ['name', 'age', 'petType', 'character', 'about', 'favorite'],
    example: {
      name: 'Tommy',
      age: 2,
      petType: '0',
      character: '0',
      about: 'Tommy is a cute dog',
      favorite: 'Tommy loves to play with kids',
      image: 'https://images.dog.ceo/breeds/terrier-norwich/n02094258_1003.jpg',
      loveCount: 0
    }
  };
  petResponseBody = {
    type: 'object',
    properties: {
      _id: {
        type: 'string',
        description: 'Pet Id'
      },
      name: {
        type: 'string',
        description: 'Pet Name'
      },
      age: {
        type: 'number',
        description: 'Pet Age'
      },
      petType: {
        type: 'string',
        description: 'Pet Type Id'
      },
      character: {
        type: 'string',
        description: 'Character Id'
      },
      about: {
        type: 'string',
        description: 'About Pet'
      },
      favorite: {
        type: 'string',
        description: 'Favorite'
      },
      image: {
        type: 'string',
        description: 'Image'
      },
      loveCount: {
        type: 'number',
        description: 'Love Count'
      },
      createDate: {
        type: 'string',
        description: 'Created Date'
      },
      updateDate: {
        type: 'string',
        description: 'Updated Date'
      },
      __v: {
        type: 'number',
        description: 'Version'
      }
    }
  };


  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: "3.0.0",
      info: {
        version: '1.0.0',
        title: 'Pet Fair',
        description: 'Ruby + Rails + PostgreSQL',
        contact: { email: 'rahathossenmanik@gmail.com' },
        license: { name: 'MIT', url: 'https://opensource.org/licenses/MIT' }
      },
      paths: {
        '/characters/getall': {
          get: {
            tags: ['Characters'],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: {
                      type: 'array',
                      items: characterResponseBody
                    }
                  }
                }
              }
            }
          }
        },
        '/characters/getbyid/{id}': {
          get: {
            tags: ['Characters'],
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                description: 'Character Id',
                schema: {
                  type: 'string'
                }
              }
            ],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: characterResponseBody
                  }
                }
              }
            }
          }
        },
        '/characters/create': {
          post: {
            tags: ['Characters'],
            requestBody: {
              content: {
                'application/json': {
                  schema: characterRequestBody
                }
              }
            },
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: characterResponseBody
                  }
                }
              }
            }
          }
        },
        '/characters/update/{id}': {
          put: {
            tags: ['Characters'],
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                description: 'Character Id',
                schema: {
                  type: 'string'
                }
              }
            ],
            requestBody: {
              content: {
                'application/json': {
                  schema: characterRequestBody
                }
              }
            },
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: characterResponseBody
                  }
                }
              }
            }
          }
        },
        '/characters/delete/{id}': {
          delete: {
            tags: ['Characters'],
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                description: 'Character Id',
                schema: {
                  type: 'string'
                }
              }
            ],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: characterResponseBody
                  }
                }
              }
            }
          }
        },
        '/pettypes/getall': {
          get: {
            tags: ['PetTypes'],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: {
                      type: 'array',
                      items: petTypeResponseBody
                    }
                  }
                }
              }
            }
          }
        },
        '/pettypes/getbyid/{id}': {
          get: {
            tags: ['PetTypes'],
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                description: 'Pet Type Id',
                schema: {
                  type: 'string'
                }
              }
            ],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: petTypeResponseBody
                  }
                }
              }
            }
          }
        },
        '/pettypes/create': {
          post: {
            tags: ['PetTypes'],
            requestBody: {
              content: {
                'application/json': {
                  schema: petTypeRequestBody
                }
              }
            },
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: petTypeResponseBody
                  }
                }
              }
            }
          }
        },
        '/pettypes/update/{id}': {
          put: {
            tags: ['PetTypes'],
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                description: 'Pet Type Id',
                schema: {
                  type: 'string'
                }
              }
            ],
            requestBody: {
              content: {
                'application/json': {
                  schema: petTypeRequestBody
                }
              }
            },
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: petTypeResponseBody
                  }
                }
              }
            }
          }
        },
        '/pettypes/delete/{id}': {
          delete: {
            tags: ['PetTypes'],
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                description: 'Pet Type Id',
                schema: {
                  type: 'string'
                }
              }
            ],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: petTypeResponseBody
                  }
                }
              }
            }
          }
        },
        '/pets/getall': {
          get: {
            tags: ['Pets'],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: {
                      type: 'array',
                      items: petResponseBody
                    }
                  }
                }
              }
            }
          }
        },
        '/pets/getbyid/{id}': {
          get: {
            tags: ['Pets'],
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                description: 'Pet Id',
                schema: {
                  type: 'string'
                }
              }
            ],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: petResponseBody
                  }
                }
              }
            }
          }
        },
        '/pets/create': {
          post: {
            tags: ['Pets'],
            requestBody: {
              content: {
                'application/json': {
                  schema: petRequestBody
                }
              }
            },
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: petResponseBody
                  }
                }
              }
            }
          }
        },
        '/pets/update/{id}': {
          put: {
            tags: ['Pets'],
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                description: 'Pet Id',
                schema: {
                  type: 'string'
                }
              }
            ],
            requestBody: {
              content: {
                'application/json': {
                  schema: petRequestBody
                }
              }
            },
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: petResponseBody
                  }
                }
              }
            }
          }
        },
        '/pets/delete/{id}': {
          delete: {
            tags: ['Pets'],
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                description: 'Pet Id',
                schema: {
                  type: 'string'
                }
              }
            ],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: petResponseBody
                  }
                }
              }
            }
          }
        },
        '/pets/getalldog': {
          get: {
            tags: ['Pets'],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: {
                      type: 'array',
                      items: petResponseBody
                    }
                  }
                }
              }
            }
          }
        },
        '/pets/getallcat': {
          get: {
            tags: ['Pets'],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: {
                      type: 'array',
                      items: petResponseBody
                    }
                  }
                }
              }
            }
          }
        },
        '/pets/getallbird': {
          get: {
            tags: ['Pets'],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: {
                      type: 'array',
                      items: petResponseBody
                    }
                  }
                }
              }
            }
          }
        },
        '/pets/getallreptile': {
          get: {
            tags: ['Pets'],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: {
                      type: 'array',
                      items: petResponseBody
                    }
                  }
                }
              }
            }
          }
        },
        '/pets/love/{id}': {
          put: {
            tags: ['Pets'],
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                description: 'Pet Id',
                schema: {
                  type: 'string'
                }
              }
            ],
            responses: {
              200=> {
                content: {
                  'application/json': {
                    schema: petResponseBody
                  }
                }
              }
            }
          }
        }
      },
      consumes: ['application/json'],
      produces: ['application/json']
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end
