---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս_������/����_����������ʧ����.lua
-- ����ʱ��:	2014/9/28 20:20:38
-- �����û�:	xueyan-pc
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/Map/̫ԭ֮ս_������/include/������״��������.lua")

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	--[[
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if BuffID == 8027 then
		local tTargetList = CheckIsDelBuff8027(scene)--����P1��״�����ж�
		if tTargetList and #tTargetList > 0 then
			local nX = 0
			local nY = 0
			local nZ = 0
			local nNum = 0
			for i = 1, #tTargetList do
				local playerThis = GetPlayer(tTargetList[i])
				if playerThis and playerThis.GetBuff(8027, nBuffLevel) then
					playerThis.DelBuff(8027, nBuffLevel)
					nX = nX + playerThis.nX
					nY = nY + playerThis.nY
					nZ = math.max(nZ, playerThis.nZ)
					nNum = nNum + 1
				else
					MsgLog("û���ҵ������ߵ���ң�"..tTargetList[i])
				end
				playerThis = nil
			end
			local npcYBQ = scene.GetNpcByNickName("ZhHQL_BaiTao_YBQ")
			if not npcYBQ then
				scene.CreateNpc(36847, nX / nNum, nY / nNum, nZ, 0, -1, "ZhHQL_BaiTao_YBQ")
			end
		end
	end
	if BuffID == 8174 then
		local tTargetList = CheckIsDelBuff8174(scene)--����P1��״�����ж�
		if tTargetList and #tTargetList > 0 then
			local nX = 0
			local nY = 0
			local nZ = 0
			local nNum = 0
			for i = 1, #tTargetList do
				local playerThis = GetPlayer(tTargetList[i])
				if playerThis and playerThis.GetBuff(8174, nBuffLevel) then
					playerThis.DelBuff(8174, nBuffLevel)
				end
				if playerThis then
					nX = nX + playerThis.nX
					nY = nY + playerThis.nY
					nZ = math.max(nZ, playerThis.nZ)
					nNum = nNum + 1
					playerThis = nil
				end

			end
			local npcYBQ = scene.GetNpcByNickName("ZhHQL_BaiTao_YBQ")
			if not npcYBQ then
				scene.CreateNpc(36852, nX / nNum, nY / nNum, nZ, 0, -1, "ZhHQL_BaiTao_YBQ")
			end
		end
	end
	--]]
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)

end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com