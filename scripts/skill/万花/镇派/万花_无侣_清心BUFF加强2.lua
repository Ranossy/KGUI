function Apply(dwCharacterID)
    local target
	if IsPlayer(dwCharacterID) then
        target = GetPlayer(dwCharacterID)
    else
        target = GetNpc(dwCharacterID)
    end
  if not target then
  	return
  end
	for i = 1, 7 do
		if target.GetBuff(112,i) then
				target.AddBuff(0,99,2712,i)
		end
	end
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com