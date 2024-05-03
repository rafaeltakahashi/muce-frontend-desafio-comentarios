import 'package:comentarios/domain/comment.dart';
import 'package:comentarios/domain/post.dart';
import 'package:comentarios/domain/user.dart';
import 'package:flutter/material.dart';

const UserReference userRafael = UserReference(
  username: "rkt0muralis",
  email: "rafael.takahashi@muralis.com.br",
  usernameColor: Colors.purple,
);

const UserReference userAran = UserReference(
  username: "aran99",
  email: "aran_debs@dustmail.fake",
  usernameColor: Colors.cyan,
);

const UserReference userMelkor = UserReference(
  username: "sexy-melkor",
  email: "joe-dustbin@dustmail.fake",
  usernameColor: Colors.red,
);

const UserReference userKazu = UserReference(
  username: "KazuYM150",
  email: "kazu150b@dustmail.fake",
  usernameColor: Colors.deepOrange,
);

const UserReference userSamsara = UserReference(
  username: "samsara",
  email: "sarvasamskara@dustmail.fake",
  usernameColor: Colors.green,
);

const UserReference userMira = UserReference(
  username: "miramira15",
  email: "miramira00015@dustmail.fake",
  usernameColor: Colors.pink,
);

var mockPost = Post(
  id: "0ccccb55-8862-446a-90b0-131140ba1726",
  writer: userMira,
  text: """
```
Inter spem cūramque, timōrēs inter et īrās
Omnem crēde diem tibi dīlūxisse suprēmum:
Grāta superveniet quae nōn spērābitur hōra.
```

Amidst anxiety and care, amidst fear and anger
Believe each day to have risen as your last:
Welcome will be the unhoped-for hour.

_From Horace's epistles._""",
  locale: '',
  date: DateTime(2024, 5, 2, 10, 3, 15),
  reactions: {
    userAran: Reaction(kind: "😢", date: DateTime(2024, 5, 2, 15, 30, 10)),
    userRafael: Reaction(kind: "👍", date: DateTime(2024, 5, 2, 15, 31, 0)),
    userKazu: Reaction(kind: "👍", date: DateTime(2024, 5, 3, 15, 30, 10)),
    userSamsara: Reaction(kind: "👍", date: DateTime(2024, 5, 3, 17, 34, 10)),
  },
  comments: [
    Comment(
      id: "a94feeaf-6060-41c1-8fae-1eb1c8254195",
      text: """
This is nonsense.
Living like every day's your last is the same as pretending you don't have a future. How is that good for anything?""",
      writer: userMelkor,
      locale: 'en-US',
      date: DateTime(2024, 5, 2, 16, 10, 30),
      reactions: {
        userAran: Reaction(kind: "🤔", date: DateTime(2024, 5, 2, 16, 10, 31)),
        userKazu: Reaction(kind: "🤔", date: DateTime(2024, 5, 2, 20, 5, 58)),
      },
      comments: [
        Comment(
          id: "bfa7f912-d612-4bf2-9381-a527a05c04d3",
          text: """
The message here is to think, "what if today was your last chance?"
What if you didn't get to go back home, didn't get to see your family and friends again? Wouldn't you want to make sure your last day was just perfect?
And at the end of it, what wouldn't you give for just one more day? Just one day, to get another chance to be with the people you care about. You bet you wouldn't be worrying about daily trivialities, you'd just _live_.

Thing is, you have that day today. You have new chances every day, so _live_: You are alive and living now. Now is the envy of all of the dead.
Carpe diem isn't about living like there's no tomorrow, it's realizing that each day is just as precious as your very last.""",
          writer: userSamsara,
          locale: 'en-US',
          reactions: {
            userAran:
                Reaction(kind: "🤯", date: DateTime(2024, 5, 2, 17, 10, 50)),
          },
          date: DateTime(2024, 5, 2, 16, 10, 36),
          comments: [
            Comment(
                id: "32bba235-e01f-4068-86d1-3e694b1138b3",
                text: """
What a beautiful interpretation, samsara. Thank you for your contribution, we're all the better for you being here.""",
                writer: userAran,
                locale: 'en-US',
                reactions: {
                  userSamsara: Reaction(
                      kind: "❤️", date: DateTime(2024, 5, 3, 12, 8, 1)),
                },
                date: DateTime(2024, 5, 3, 12, 7, 22))
          ],
        ),
      ],
    ),
    Comment(
      id: "00ff8146-4e6c-46cf-9165-b568f895334d",
      text: """
Tradução (minha):

> Entre inseguranças e preocupações, entre temores e iras,
Creia ser o último cada dia a ti nascido:
Bem-vinda virá a não esperada hora.
""",
      writer: userKazu,
      locale: 'pt-BR',
      date: DateTime(2024, 5, 3, 1, 9, 45),
      reactions: {
        userMelkor:
            Reaction(kind: "👍", date: DateTime(2024, 5, 3, 15, 30, 10)),
        userKazu: Reaction(kind: "👍", date: DateTime(2024, 5, 4, 15, 31, 0)),
        userSamsara:
            Reaction(kind: "👍", date: DateTime(2024, 5, 4, 15, 30, 10)),
        userMira: Reaction(kind: "👍", date: DateTime(2024, 5, 4, 17, 34, 10)),
      },
      comments: [
        Comment(
          id: "010d397e-5dfc-4374-8796-bb129a8a1d4c",
          text: """
Obrigada pela sua contribuição! Admito que a frase é difícil de entender. Samsara deixou um lindíssimo comentário e eu concordo muito 🌄""",
          writer: userMira,
          locale: "pt-BR",
          date: DateTime(2024, 5, 4, 16, 2, 2),
          reactions: {
            userSamsara:
                Reaction(kind: "❤️", date: DateTime(2024, 5, 3, 12, 8, 1)),
          },
        )
      ],
    ),
  ],
);
