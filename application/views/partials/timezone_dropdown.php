<select <?= $attributes ?>>
    <?php foreach ($timezones as $continent => $entries) : ?>
        <optgroup label="<?= $continent ?>">
            <?php foreach ($entries as $value => $name) : ?>
                <option <?= $value == "Europe/Istanbul" ? "selected" : null ?> value="<?= $value ?>"><?= $name ?></option>
            <?php endforeach ?>
        </optgroup>
    <?php endforeach ?>
</select>