----------------------------------------------------------------------
--Name: Ӣ��ݶ����_���_���
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com