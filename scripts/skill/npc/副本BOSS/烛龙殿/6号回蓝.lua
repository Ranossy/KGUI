function Apply(dwCharacterID)
	local character = nil
	if IsPlayer(dwCharacterID) then
		character = GetPlayer(dwCharacterID)
	else
		character = GetNpc(dwCharacterID)
	end
	local buff = character.GetBuff(3749,1)
	local nStack = buff.nStackNum
	character.nCurrentMana = character.nCurrentMana + 25*nStack

end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com