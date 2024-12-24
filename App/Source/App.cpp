#include "corepch.h"
#include "Core/Core.h"

int main()
{
	sf::RenderWindow window(sf::VideoMode(sf::Vector2u(800, 600)), "App", sf::Style::Titlebar | sf::Style::Close);
	window.setVerticalSyncEnabled(true);

	while (window.isOpen())
	{
		while (const std::optional event = window.pollEvent())
		{
			if (event->is<sf::Event::Closed>() ||
				(
					event->is<sf::Event::KeyPressed>() &&
					event->getIf < sf::Event::KeyPressed>()->code == sf::Keyboard::Key::Escape)
				)
			{
				if (event->is<sf::Event::Closed>())
				{
					window.close();
					break;
				}
			}
		}
		
		window.clear();

		window.display();
	}
	return 0;
}