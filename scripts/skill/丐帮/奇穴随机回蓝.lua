---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/ؤ��/��Ѩ�������.lua
-- ����ʱ��:	2013/6/8 14:21:44
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	--player.nCurrentMana = player.nCurrentMana + 0.5 * player.nMaxMana
	local i = Random(1, 1000)
	if player.GetSkillLevel(6855) == 1 then
		if i <= 300 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.1
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com