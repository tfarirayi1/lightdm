[CCode (cprefix = "LightDM", lower_case_cprefix = "lightdm_", cheader_filename = "lightdm/greeter.h")]
namespace LightDM {
    public unowned string hostname { get; }
    public unowned string default_language { get; }
    public unowned GLib.List<weak LightDM.Language> get_languages ();
    public unowned GLib.List<weak LightDM.Layout> get_layouts ();
    public unowned string layout { get; set; }
    public bool can_suspend { get; }
    public void suspend ();
    public bool can_hibernate { get; }
    public void hibernate ();
    public bool can_restart { get; }
    public void restart ();
    public bool can_shutdown { get; }
    public void shutdown ();

    public class Greeter : GLib.Object {
        public Greeter ();
        public signal void connected ();
        public signal void show_message (string text, MessageType type);
        public signal void show_prompt (string text, PromptType type);
        public signal void authentication_complete ();
        public signal void session_failed ();
        public signal void autologin_timer_expired ();
        public signal void quit ();

        public bool connect_to_server ();
        public unowned string get_hint (string name);
        public unowned string default_session_hint { get; };
        public bool hide_users_hint { get; };
        public bool has_guest_account_hint { get; };
        public unowned string select_user_hint { get; };
        public bool select_guest_hint { get; };
        public unowned string autologin_user_hint { get; };
        public bool autologin_guest_hint { get; };
        public int autologin_timeout_hint { get; };
        public void cancel_timed_login ();
        public void authenticate (string? username = null);
        public void authenticate_as_guest ();
        public void respond (string response);
        public void cancel_authentication ();
        public bool in_authentication { get; }
        public bool is_authenticated { get; }
        public unowned string authentication_user { get; }
        public void start_session (string? session);
        public void start_default_session ();
    }
    public enum MessageType {
        INFO,
        ERROR
    }
    public enum PromptType {
        QUESTION,
        SECRET
    }
    public class Language : GLib.Object {
        public unowned string code { get; }
        public unowned string name { get; }
        public unowned string territory { get; }
    }
    public class Layout : GLib.Object {
        public unowned string description { get; }
        public unowned string name { get; }
        public unowned string short_description { get; }
    }
    public class Session : GLib.Object {
        public unowned string comment { get; }
        public unowned string key { get; }
        public unowned string name { get; }
    }
    public class UserList : GLib.Object {
        public signal void user_added (User user);
        public signal void user_changed (User user);
        public signal void user_removed (User user);

        public UserList ();
        public int num_users { get; }
        public unowned GLib.List<weak LightDM.User> get_users ();
        public unowned LightDM.User get_user_by_name (string username);
    }
    public class User : GLib.Object {
        public signal void changed ();

        public unowned string display_name { get; }
        public unowned string image { get; }
        public unowned string language { get; }
        public unowned string layout { get; }
        public bool logged_in { get; }
        public unowned string name { get; }
        public unowned string real_name { get; }
        public unowned string session { get; }
    }
}
