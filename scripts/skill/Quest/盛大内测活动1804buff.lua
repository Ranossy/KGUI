function Apply(dwCharacterID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nLevel = player.nLevel
	if nLevel >= 1 and nLevel <= 9 then
		--1��
		player.AddMoney(0, 0, 1 * 10000)
		player.AddBuff(0, 99, 1804, 1)
	elseif nLevel >= 10 and nLevel <= 19 then
		--10��150��Ϊ
		player.AddMoney(0, 0, 10 * 10000)
		player.AddTrainNoLimit(150)
		player.AddBuff(0, 99, 1804, 1)
	elseif nLevel >= 20 and nLevel <= 29 then
		--10��300��Ϊ
		player.AddMoney(0, 0, 10 * 10000)
		player.AddTrainNoLimit(300)
		player.AddBuff(0, 99, 1804, 1)
	elseif nLevel >= 30 and nLevel <= 69 then
		--50��1500��Ϊ
		player.AddMoney(0, 0, 50 * 10000)
		player.AddTrainNoLimit(1500)
		player.AddBuff(0, 99, 1804, 1, 3)
	elseif nLevel == 70 then
		--30��1200��Ϊ
		player.AddMoney(0, 0, 30 * 10000)
		player.AddTrainNoLimit(1200)
		player.AddBuff(0, 99, 1804, 1, 3)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com