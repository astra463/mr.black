-- Создаем таблицу пользователей
CREATE TABLE IF NOT EXISTS users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Уникальный идентификатор
  telegram_chat_id TEXT,                 -- Telegram chat ID
  name TEXT NOT NULL,                    -- Имя пользователя
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Дата создания пользователя
  net_worth REAL DEFAULT 0               -- Баланс пользователя (начинается с 0)
);

-- Создаем таблицу категорий
CREATE TABLE IF NOT EXISTS categories (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  parent_id INTEGER DEFAULT NULL,
  user_id INTEGER NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (parent_id) REFERENCES categories (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Создаем таблицу транзакций
CREATE TABLE IF NOT EXISTS transactions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  amount REAL NOT NULL,
  category_id INTEGER NOT NULL,
  description TEXT DEFAULT NULL,
  date DATETIME DEFAULT CURRENT_TIMESTAMP,
  user_id INTEGER NOT NULL, -- Добавляем связь с пользователем
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES categories (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
);
