![Image of Pokémon Mended Crystal Title Screen](https://github.com/JySzE/Mended-Crystal/assets/70117278/8c78b3e2-d2bc-47f0-b3a3-fceb3b7b0c1e)

Mended Crystal is inspired by **UberMedic7's Patched-Crystal**. 

While there are notable differences, both projects enhance Pokémon Crystal while preserving the essence of Generation 2.

This ROM hack includes numerous quality of life changes without altering the original story. 

Here’s a summary of the features and improvements:

## 1. Bug Fixes

- [All documented bugs from the pret repo fixed.](https://github.com/pret/pokecrystal/blob/master/docs/bugs_and_glitches.md)

## 2. Gameplay Improvements

### General Improvements

- Obtain all 251 Pokémon without trading.
- Altered evolution methods for version exclusives and trade evolutions.
- [Unlimited TM usage.](https://github.com/pret/pokecrystal/wiki/Infinitely-reusable-TMs)
- [Generation 6 Experience System implemented.](https://github.com/pret/pokecrystal/wiki/Generation-6-Experience-System#1-rework-the-exp-share-item)
- [Gain experience from catching Pokémon.](https://github.com/pret/pokecrystal/wiki/Gain-experience-from-catching-Pok%C3%A9mon)
- [New battle text to clarify status move misses and fails.](https://github.com/pret/pokecrystal/wiki/Make-new-battle-text-to-distinguish-status-move-misses-and-fails)
- [Modify existing gender formula.](https://github.com/pret/pokecrystal/wiki/Modify-existing-gender-formula)
- [Link Cord for trade evolutions available at Goldenrod Dept. Store.](https://github.com/UberMedic7/patched-crystal/blob/c0f43e61025627343a8153f11653817ebd9623cc/data/items/marts.asm#L127)
- [Smashing rocks now yields items, including fossils.](https://github.com/pret/pokecrystal/wiki/Smashing-rocks-has-a-chance-to-contain-items)
- [New battle rewards from Battle Tower and Buena’s Password.](https://github.com/UberMedic7/patched-crystal/blob/Version3.0/data/trainers/parties.asm)
- [New Berry Pocket for Berries and Apricorns.](https://github.com/pret/pokecrystal/wiki/Add-a-new-Pack-pocket#10-update-the-crystal-only-pack-engine)
- [Move Relearner NPC added.](https://github.com/pret/pokecrystal/wiki/Add-a-Move-Reminder)
- [Correct grammar for plural trainers like Twins.](https://github.com/pret/pokecrystal/wiki/Correct-grammar-for-plural-trainers-like-Twins)
- [Show move names when you receive a TM or HM.](https://github.com/pret/pokecrystal/wiki/Show-move-names-when-you-receive-a-TM-or-HM)
- [Reviving Pokemon from Fossils.](https://github.com/pret/pokecrystal/wiki/Reviving-Pok%C3%A9mon-from-Fossils-(Gen-I))
- [Lottery Corner generates a lucky number daily instead of weekly.](https://github.com/pret/pokecrystal/wiki/Make-the-Lottery-Corner-generate-a-lucky-number-daily-instead-of-weekly)
- [Short beeping noise for low HP.](https://github.com/pret/pokecrystal/wiki/Short-beeping-noise-for-low-HP)
- [Gym Leaders rematchs after you gain access to MT. Silver.](https://github.com/UberMedic7/patched-crystal/blob/Version3.0/data/trainers/parties.asm)

### Convenience Features

- [Kurt makes Poké Balls instantly.](https://github.com/pret/pokecrystal/wiki/Kurt-Makes-Pokeballs-Instantly)
- [Simplified clock reset (Down + B at title screen).](https://github.com/pret/pokecrystal/wiki/Simplify-the-Clock-Reset-Procedure)
- [Instant text scrolling speed set as new default.](https://github.com/pret/pokecrystal/wiki/Add-a-new-text-scrolling-speed)
- [Removed save delay (overwrite confirmation retained).](https://github.com/pret/pokecrystal/wiki/Remove-the-artificial-save-delay)
- [Automatically reuse Repel.](https://github.com/pret/pokecrystal/wiki/Automatically-reuse-Repel)
- [Change the speed of healing at a Pokemon Center.](https://github.com/pret/pokecrystal/wiki/Tips-and-tricks#change-the-speed-of-healing-at-a-pok%C3%A9mon-center)
- Make ALL eggs 30% easier to hatch.
- [Pokemon can now use Field moves without learning them.](https://github.com/pret/pokecrystal/wiki/Allow-using-a-field-move-if-the-Pokemon-can-learn-it)
- <details>
  <summary>Field move details</summary>
  <ul>
    <li>Requires you to have the HM or TM + the required badge and situation to use field moves.</li>
    <li>Requires you to have a Pokémon in the party that can learn the TM or HM.</li>
    <li>Do not worry if they do not show up in your Pokémon submenu. Only field moves you manually have to call, with no physical interactive object, will show up in the submenu, and only when allowed (like Fly, Flash, Sweet Scent, etc.).</li>
    <li>For example, Fly will only show up when outside and will NOT appear in the submenu if inside a cave or building.</li>
    <li>For example, Surf, Whirlpool, and Waterfall will never show up in the submenu but will work as long as you have the HM, the required badge, and a Pokémon in the party that can learn it. Simply press 'A' at the object and it will work.</li>
    <li>For example, Headbutt will not show up in the Pokémon submenu and only requires you to have the TM and a Pokémon in the party that can learn it. Simply go up to a tree and press 'A'.</li>
    <li>You are still free to teach your Pokémon any TM or HM field move you want! This feature is simply a nice way to avoid wasting a move slot or keeping an HM slave in your team.</li>
  </ul>
</details>

## 3. Cosmetic Changes

- Altered title screen.
- Updated generic Pokémon sprites (indoor and outdoor).
- [Color Pokemon pictures shown in overworld.](https://github.com/pret/pokecrystal/wiki/Color-Pok%C3%A9mon-pictures-shown-in-overworld)
- [New party menu icons.](https://github.com/pret/pokecrystal/wiki/Add-a-new-party-menu-icon)
  - [Icons from SoupPotato's Sour Crystal.](https://github.com/SoupPotato/Sourcrystal/tree/master/gfx/icons)
- [Party menu icons colored by species.](https://github.com/pret/pokecrystal/wiki/Color-party-menu-icons-by-species)
- [New Lapras surfing sprite by DamienDoury.](https://github.com/DamienDoury/pokecrystal/blob/master/gfx/sprites/surf.png)
- [Unique colors for each Poké Ball thrown.](https://github.com/pret/pokecrystal/wiki/Use-unique-colors-for-each-thrown-Pok%C3%A9-Ball)
- [Current weather icons shown in battle.](https://github.com/pret/pokecrystal/wiki/Show-an-icon-for-the-current-weather)
- [Time of day icons shown in battle.](https://github.com/pret/pokecrystal/wiki/Show-an-icon-for-the-current-Time-of-Day)
- [Added a third trainer card page for Kanto badges.](https://github.com/pret/pokecrystal/wiki/Add-a-third-trainer-card-page-for-Kanto-badges)
- [Colored trainer card badges for both Johto and Kanto.](https://github.com/pret/pokecrystal/wiki/Colored-trainer-card-badges)
- [Show the tops of leaders heads on the trainer card for Johto and Kanto.](https://github.com/pret/pokecrystal/wiki/Show-the-tops-of-leaders-heads-on-the-trainer-card)
- [Option to show shiny colors in Pokedex. (press select)](https://github.com/pret/pokecrystal/wiki/Option-to-show-shiny-colors-in-Pok%C3%A9dex)
- [Tiles are now still animated even if a text box is open.](https://github.com/pret/pokecrystal/wiki/Tips-and-tricks#animate-tiles-even-when-textboxes-are-open)
- [Display more information on the move screen.](https://github.com/pret/pokecrystal/wiki/Display-more-information-on-the-move-screen)
- [Add 4th Stats Page [Met, DVs, Hidden Power] Thanks getkosiorekt.](https://github.com/pret/pokecrystal/wiki/Add-a-fourth-stats-page)

## 4. Balance Adjustments

### Type and stats

- [Ghost type attacks are now special and Dark type attacks are now physical.](https://github.com/UberMedic7/patched-crystal/blob/Version3.0/constants/type_constants.asm)
- Chikorita, Bayleef and Meganium all got very minor buffs to defense and special defense.
- Chikorita, Bayleef and Meganium all got revised evolution movesets and egg moves.

### Moves

- [Lugia and Ho-Oh now have signature moves instead of Gust.](https://github.com/UberMedic7/patched-crystal/blob/Version3.0/data/pokemon/evos_attacks.asm)
- [Tri-Attack can no longer inflict BRN on FIRE types and FRZ on ICE types.](https://github.com/pret/pokecrystal/wiki/Prevent-Steel%E2%80%90types-from-being-poisoned-by-Twineedle)
- Entei and Raikou both now learn Roar at 41.
- [Gyarados can learn Fly.](https://i.imgur.com/5t4irK1.jpeg)
- Lapras can learn Waterfall.
- Quagsire can learn Waterfall
- TM09 (Psych Up) sold in the 3F Celadon Store.
- Twisted Spoons can be found in the Saffron Mart.

### Wild Levels

- <details>
  <summary>Johto Grass Mons.</summary>
  <table>
    <thead>
      <tr>
        <th>Level Range</th>
        <th>% Increase</th>
        <th>New Range Rounded</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>01 - 02</td>
        <td>+ 85%</td>
        <td>02 - 04</td>
      </tr>
      <tr>
        <td>03 - 03</td>
        <td>+ 55%</td>
        <td>05 - 05</td>
      </tr>
      <tr>
        <td>04 - 06</td>
        <td>+ 0%</td>
        <td>04 - 06</td>
      </tr>
      <tr>
        <td>07 - 10</td>
        <td>+ 10%</td>
        <td>08 - 11</td>
      </tr>
      <tr>
        <td>11 - 15</td>
        <td>+ 12%</td>
        <td>12 - 17</td>
      </tr>
      <tr>
        <td>16 - 20</td>
        <td>+ 15%</td>
        <td>18 - 23</td>
      </tr>
      <tr>
        <td>21 - 25</td>
        <td>+ 18%</td>
        <td>25 - 30</td>
      </tr>
      <tr>
        <td>26 - 30</td>
        <td>+ 21%</td>
        <td>31 - 36</td>
      </tr>
      <tr>
        <td>31 - 35</td>
        <td>+ 24%</td>
        <td>38 - 43</td>
      </tr>
      <tr>
        <td>36 - 40</td>
        <td>+ 20%</td>
        <td>43 - 48</td>
      </tr>
    </tbody>
  </table>
</details>

- <details>
  <summary>Johto Water Mons.</summary>
  <table>
    <thead>
      <tr>
        <th>Level Range</th>
        <th>New Range</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>01 - 10</td>
        <td>18 - 20</td>
      </tr>
      <tr>
        <td>15 - 15</td>
        <td>25 - 26</td>
      </tr>
      <tr>
        <td>20 - 20</td>
        <td>30 - 32</td>
      </tr>
      <tr>
        <td>35 - 35</td>
        <td>44 - 46</td>
      </tr>
      <tr>
        <td>40 - 40</td>
        <td>50 - 52</td>
      </tr>
    </tbody>
  </table>
</details>

- <details>
  <summary>Kanto Grass Mons.</summary>
  <table>
    <thead>
      <tr>
        <th>Level Range</th>
        <th>New Range</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>01 - 15</td>
        <td>36 - 38</td>
      </tr>
      <tr>
        <td>16 - 20</td>
        <td>38 - 42</td>
      </tr>
      <tr>
        <td>21 - 25</td>
        <td>38 - 42</td>
      </tr>
      <tr>
        <td>26 - 30</td>
        <td>42 - 44</td>
      </tr>
      <tr>
        <td>31 - 45</td>
        <td>42 - 44</td>
      </tr>
      <tr>
        <td>36 - 40</td>
        <td>44 - 46</td>
      </tr>
      <tr>
        <td>41 - 45</td>
        <td>44 - 46</td>
      </tr>
    </tbody>
  </table>
</details>

- <details>
  <summary>Kanto Water Mons.</summary>
  <table>
    <thead>
      <tr>
        <th>Level Range</th>
        <th>New Range</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>05 - 15</td>
        <td>36 - 38</td>
      </tr>
      <tr>
        <td>20 - 20</td>
        <td>40 - 42</td>
      </tr>
      <tr>
        <td>30 - 35</td>
        <td>42 - 44</td>
      </tr>
    </tbody>
  </table>
</details>

- <details>
  <summary>Johto Grass Swarm Mons.</summary>
  <table>
    <thead>
      <tr>
        <th>Level Range</th>
        <th>New Range</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>01 - 04</td>
        <td>05 - 05</td>
      </tr>
      <tr>
        <td>10 - 14</td>
        <td>16 - 18</td>
      </tr>
    </tbody>
  </table>
</details>

- <details>
  <summary>Johto Tree Mons.</summary>
  <table>
    <thead>
      <tr>
        <th>Level</th>
        <th>New</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>10</td>
        <td>15</td>
      </tr>
      <tr>
        <td>15</td>
        <td>20</td>
      </tr>
    </tbody>
  </table>
</details>

- Lapras wild level is now 30.
- Eevee you receive in goldenrod is now level 15 instead of 20.

### Trainer Levels

- [Johto & Kanto Gyms, Rival, E4, & Red All got level increases, smaller teams were given a new addition to make it more consistent.](/data/trainers/parties.asm)

- <details>
  <summary>All random trainers.</summary>
  <table>
    <thead>
      <tr>
        <th>Level Range</th>
        <th>% Increase</th>
        <th>New Range Rounded</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>01 - 05</td>
        <td>+ 10%</td>
        <td>01 - 06</td>
      </tr>
      <tr>
        <td>06 - 10</td>
        <td>+ 10%</td>
        <td>07 - 11</td>
      </tr>
      <tr>
        <td>11 - 15</td>
        <td>+ 12%</td>
        <td>12 - 17</td>
      </tr>
      <tr>
        <td>16 - 20</td>
        <td>+ 15%</td>
        <td>18 - 23</td>
      </tr>
      <tr>
        <td>21 - 25</td>
        <td>+ 18%</td>
        <td>25 - 30</td>
      </tr>
      <tr>
        <td>26 - 30</td>
        <td>+ 21%</td>
        <td>31 - 36</td>
      </tr>
      <tr>
        <td>31 - 35</td>
        <td>+ 24%</td>
        <td>38 - 43</td>
      </tr>
      <tr>
        <td>36 - 40</td>
        <td>+ 20%</td>
        <td>43 - 48</td>
      </tr>
    </tbody>
  </table>
</details>

## 5. Special Events & Encounters

- [Celebi event restored with new dialogue.](https://github.com/pret/pokecrystal/wiki/Restore-the-GS-Ball-Celebi-Event)
- [Kanto Legendary Birds.](https://github.com/UberMedic7/patched-crystal/blob/Version3.0/data/wild/flee_mons.asm)
- Reduced flee chance for Entei and Raikou (100% ~> 10% per turn).
- Mewtwo and Mew.

## Additional Information

### Questions

- <details>
  <summary>Where do I find fossil Pokemon?</summary>
  <p>You can find fossils by smashing rocks with Rock Smash! You can then revive said fossils using an NPC inside the Ruins of Alph Research Center!</p>
</details>

- <details>
  <summary>Is it possible to Trade & Battle in this?</summary>
  <p>Yes! But it requires 2 copies of Mended Crystal to work properly, it will not work with vanilla copies or other ROM hacks.</p>
</details>

- <details>
  <summary>Are you planning to add more to this ROM hack?</summary>
  <p>I plan to add more features as the pret wiki updates with additional quality of life improvements, but only if they seem worthwhile.</p>
  <p>If you encounter any bugs or have suggestions, feel free to submit a pull request, and I will review it.</p>
  <p>As long as the changes maintain the overall feel of Generation 2, I’m open to adding more!</p>
</details>

- <details>
  <summary>What item are found from smashing rocks?</summary>
  <ul>
    <li>Metal Coat</li>
    <li>Thick Club</li>
    <li>Nugget</li>
    <li>Star Piece</li>
    <li>Big Pearl</li>
    <li>Dome Fossil</li>
    <li>Helix Fossil</li>
    <li>Old Amber</li>
    <li>Brick Piece</li>
    <li>Pearl</li>
  </ul>
</details>

- <details>
  <summary>What rewards can I get from the Battle Tower?</summary>
  <ul>
    <li>Master Ball x1</li>
    <li>Revive x5</li>
    <li>Max Potion x5</li>
    <li>Full Restore x5</li>
    <li>HP Up x5</li>
    <li>Protein x5</li>
    <li>Iron x5</li>
    <li>Carbos x5</li>
    <li>Calcium x5</li>
    <li>Rare Candy x5</li>
    <li>Full Heal x5</li>
    <li>PP Up x5</li>
    <li>Berserk Gene x5</li>
    <li>Normal Box x1</li>
    <li>Gorgeous Box x1</li>
    <li>Gold & Silver Leafs x5</li>
  </ul>
</details>

- <details>
  <summary>What are Buena's Password Rewards?</summary>
  <ul>
    <li>2 Blue Card points: Ultra Ball, Full Restore</li>
    <li>3 Blue Card points: Nugget, Rare Candy</li>
    <li>5 Blue Card points: Protein, Iron, Carbos, Calcium, HP Up</li>
    <li>6 Blue Card points: PP Up</li>
    <li>7 Blue Card points: Gold Leaf</li>
    <li>8 Blue Card points: Silver Leaf</li>
    <li>9 Blue Card points: Mysteryberry, Gold Berry, Berry Juice, Lucky Punch, Mirage Mail</li>
  </ul>
</details>


### Guides

- [Pokemon location and Evolution Guide.](Encounters%20&%20Evolutions.md)
- [Build Instructions.](INSTALL.md) 

