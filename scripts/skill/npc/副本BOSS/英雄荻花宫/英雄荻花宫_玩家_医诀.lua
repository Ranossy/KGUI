----------------------------------------------------------------------
--Name: 英雄荻花宫_玩家_灭绝
--Date:	
--Author:	
--Version: Alpha1
--Comment:	
----------------------------------------------------------------------

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.CanLearnSkillRecipe(516, 1) then
		player.AddSkillRecipe(516, 1)
	end
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if not player.CanLearnSkillRecipe(516, 1) then
		player.DelSkillRecipe(516, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com