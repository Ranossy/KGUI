---------------------------------------------------------------------->
-- �ű�����:	scripts\skill\npc\����BOSS\������_�۷��\��������\buff\���䡤��.lua
-- ����ʱ��:	2014/7/14 17:06:43
-- �����û�:	ZHENGYUCHAO
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/Map/������_�۷��/include/��������ͨ������.lua")

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	
	local myBoss = GetNpc(dwCharacterID)
	if not myBoss then
		return
	end

	local commonData = DuguData[myBoss.GetMapID()]
	local scene = myBoss.GetScene()

	local distanceToDamage = commonData.CantCloseDistance
	local distanceAsPoint = distanceToDamage * 64
	
	
	local tPlayerList = scene.GetAllPlayer()
	for i = 1, #tPlayerList do
		local thisPlayerID = tPlayerList[i]
		local thisPlayer = GetPlayer(tPlayerList[i])
		if thisPlayer and thisPlayer.nMoveState ~= MOVE_STATE.ON_DEATH and thisPlayer.dwIdentityVisiableID == 0 then
			local xdis = myBoss.nX - thisPlayer.nX
			local ydis = myBoss.nY - thisPlayer.nY
			
			if  (xdis * xdis + ydis * ydis) < (distanceAsPoint * distanceAsPoint) then
				local damageCost = thisPlayer.nMaxLife * commonData.BiLuoHpCostPercent / 100
				thisPlayer.CustomDamage(myBoss.dwID, commonData.BiLuoChantSkillID, commonData.BiLuoChantSkillLevel, 1, damageCost)
			end
		end
	end
end
-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com