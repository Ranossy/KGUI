function Apply(dwCharacterID)
    local target
	local Num_Random = Random(1, 1024)
	if IsPlayer(dwCharacterID) then
        target = GetPlayer(dwCharacterID)
    else
        target = GetNpc(dwCharacterID)
    end
	if Num_Random < 154 then
		target.AddBuff(0, 99, 713, 1)
	end
end
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com