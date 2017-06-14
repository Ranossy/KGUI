---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/����/��������_BUFF����2.lua
-- ����ʱ��:	2013/4/29 11:24:21
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  DefaultBuff.lua
-- ������    :  CBG
-- ����ʱ��  :  2011-04-16
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local pet = GetNpc(nCharacterID)
	if not pet then
		return
	end
	local player = GetPlayer(pet.dwEmployer)
	if player and player.nMoveState ~= 16 then
		if player.GetSkillLevel(6880) == 1 then
			player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.05
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.25
		end
		if player.GetSkillLevel(6885) == 1 then
			for i = 1 , 3 do
				player.AddBuff(player.dwID, player.nLevel, 2844, 1)
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com