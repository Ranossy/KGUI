---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/վ������װ��.lua
-- ����ʱ��:	03/10/10 10:59:39
-- �����û�:	wujuan
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	-- ����Ҫ����������ֵ��ȷ��: 1] �Ƿ����ʹ�õ����Դ����� 2] �Ƿ����ٴ˵���
	local nX, nY = 52436, 58310
	local nMapID = 46
	local nDis = 5100
	local nDisNow = ((player.nX - nX) ^ 2 + (player.nY - nY) ^ 2) ^ 0.5
	local scene = player.GetScene()
	if scene and scene.dwMapID == nMapID and nDisNow <= nDis then
		player.AddBuff(0, 99, 1731, 1)
	else
		player.SendSystemMessage(SKILL_STRING_TABLE[26474])
	end
	return false, false
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com