------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-8-23
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	npc.AddBuff(0, 99, 6600, 1)
	local scene = npc.GetScene()
	if not scene then
		return
	end
	local tName = {"dunshou", "toushou", "jianshou", "cishou"}
	local tName1 = {"doodad_ds", "doodad_ts", "doodad_js", "doodad_cs"}
	for i = 1, 4 do
		if npc.szName == "BOSS4_" .. i then
			local npc_shou = scene.GetNpcByNickName(tName[i])
			if npc_shou then
				npc_shou.DoAction(0, 0)
				npc_shou.DoAction(0, 10061)
			end
			local doodad_s = scene.GetDoodadByNickName(tName1[i])
			if doodad_s then
				doodad_s.OpenDoor()
			end
			return
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com