class AddCheckUserIdFunction < ActiveRecord::Migration[5.2]
  # def reversible
  #   execute <<-SQL
  #   CREATE FUNCTION check_for_user_dups()
  #   RETURNS trigger AS
  #   $func$
  #   BEGIN
  #   PERFORM 1 FROM users where NEW.id=id;
  #   IF FOUND THEN
  #   RAISE unique_violation USING MESSAGE = 'Duplicate ID: ' || NEW.id;
  #   RETURN NULL;
  #   END IF;
  #   RETURN NEW;
  #   END;
  #   $func$ LANGUAGE plpgsql;
  #   SQL
  # end
end
