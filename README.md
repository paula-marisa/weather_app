# Weather App

**Weather App** é uma aplicação Flutter que permite consultar a previsão meteorológica de qualquer cidade em tempo real. A interface apresenta um gradiente dinâmico, animações Lottie de acordo com o clima.

---

## 🚀 Funcionalidades

* Consultar o clima atual: descrição, temperatura e ícone.
* Fundo com gradiente dinâmico conforme as condições meteorológicas.
* Animações Lottie para chuva, nuvens e sol.
* Indicador de loading e tratamento de erros.
* Mensagem de boas-vindas antes da primeira pesquisa.

---

## 📋 Pré-requisitos

* Flutter SDK (versão >= 3.0) instalado e configurado no PATH.
* Android Studio ou VS Code com plugins Flutter e Dart.
* Android SDK configurado (e licenças aceites via `flutter doctor --android-licenses`).
* Conta gratuita no OpenWeatherMap e API Key válida.

---

## 🛠️ Instalação e execução

1. **Clonar repositório**:

   ```bash
   git clone https://github.com/paula-marisa/weather_app.git
   cd weather_app
   ```

2. **Instalar dependências**:

   ```bash
   flutter pub get
   ```

3. **Configurar API Key**:

    * Abra `lib/services/weather_service.dart`.
    * Substitua o valor de `_apiKey` pela tua chave obtida em [OpenWeatherMap](https://home.openweathermap.org/api_keys).

4. **Executar no emulador/dispositivo**:

    * Iniciar um AVD (Android Virtual Device) ou conectar um dispositivo físico.
    * No terminal:

      ```bash
      flutter run
      ```

---

## 📂 Estrutura do projeto

```
weather_app/
├─ android/                # Código nativo Android
├─ ios/                    # Código nativo iOS
├─ lib/                    # Código Dart principal
│  ├─ main.dart            # Entrypoint da aplicação
│  ├─ models/              # Modelos de dados (Weather, Forecast)
│  ├─ services/            # Lógica de chamadas à API
│  ├─ providers/           # State management (Provider)
│  └─ ui/                  # Interfaces e widgets
│     ├─ home_page.dart    # Página principal
│     └─ widgets/          # Componentes reutilizáveis
├─ assets/                 # Animações Lottie
│  └─ animations/
│     ├─ sunny.json        # Sol
│     ├─ cloudy.json       # Nuvens
│     └─ rain.json         # Chuva
├─ pubspec.yaml            # Definições de dependências e assets
└─ README.md               # Documentação e instruções
```

---

## 🎨 Design e experiência

* **Gradiente**: cores seleccionadas conforme o estado do tempo para melhorar a legibilidade.
* **Lottie**: animações leves que reflectem chuva, nuvens ou sol.
* **Placeholder inicial**: menagem de boas-vindas antes de qualquer pesquisa.
* **Hot Reload**: suporte total para desenvolvimento rápido.

---

## 🤝 Contribuição

Contribuições são bem-vindas! Siga estes passos:

1. Fork deste repositório.
2. Criar uma branch para a feature: `git checkout -b feature/nome-da-feature`.
3. Fazer commit das tuas alterações: `git commit -m "feat: descrição da feature"`.
4. Push para a branch: `git push origin feature/nome-da-feature`.
5. Abra um Pull Request.

Por favor, certifica-te de que o código segue as boas práticas do Flutter.

---

## 📝 Licença

---
