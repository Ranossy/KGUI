---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��ʷ֮��_����ɯ_����ĪΥ_��ը.lua
-- ����ʱ��:	2013/5/29 11:36:27
-- �����û�:	LILIN1-PC
-- �ű�˵��:	
----------------------------------------------------------------------<

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.GetBuff(5839, 1) then
		player.DelGroupBuff(5839, 1)
	end
end

function UnApply(dwCharacterID)
	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com