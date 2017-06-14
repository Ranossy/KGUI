---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/��è��̯����_չ��.lua
-- ����ʱ��:	2016/2/20 14:14:13
-- �����û�:	FENGMENGJIE
-- �ű�˵��:
----------------------------------------------------------------------<
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�Ҽ����/��è��̯����_չ��.lua",
		0
	);

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 1025);

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	-- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 17236 and player.dwBackItemIndex ~= 19238 then --������ʱ����жϴ���
		return false
	end
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)

	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if not player.nMoveState == MOVE_STATE.ON_STAND then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(8, 444), 4)
		player.SendSystemMessage(GetEditorString(8, 445))
		return
	end

	local scene = player.GetScene()
	if not CustomFunction.CheckMapForRepresentApply(scene) then
		player.SendSystemMessage(GetEditorString(6, 1299))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 1315), 4)
		return
	end

	-- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
	if player.dwBackItemIndex ~= 17236 and player.dwBackItemIndex ~= 19238 then --������ʱ����жϴ���
		return
	end
	
	--ɾ������---
	for i = 1, 100 do
		player.DelGroupBuff(409, i)
	end

	local npcX = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
	if npcX then
		player.SendSystemMessage(GetEditorString(9, 8845))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8845), 4)
		return
	else

		local scene = player.GetScene()
		
		--����NPC--��̯
		local nA = 0 --���ƫ�ƽǶ�
		local nL = 1 * 64 --���ƫ�ƾ���
		local dwX_npc_mt,dwY_npc_mt,dwF_npc_mt = GetPoint_xyf(player.nX,player.nY,player.nFaceDirection,nA,nL)
				
		scene.CreateNpc(41160, dwX_npc_mt, dwY_npc_mt, player.nZ, 0, 16 * 2, "FXF_XM_1" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY - 70, player.nZ, 0, 16 * 2, "FXF_XM_2" .. player.dwID)
		scene.CreateNpc(41160, player.nX - 70, player.nY + 70, player.nZ, 0, 16 * 2, "FXF_XM_3" .. player.dwID)
		scene.CreateNpc(41160, player.nX + 70, player.nY - 70, player.nZ, 0, 16 * 2, "FXF_XM_4" .. player.dwID)

		player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/װ��/�Ҽ����/��è��̯����_չ��.lua", 0, 0)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	if not scene then
		return
	end
	if nParam1 == 0 then
		local szName1 = "FXF_XM_1" .. player.dwID
		local szName2 = "FXF_XM_2" .. player.dwID
		local szName3 = "FXF_XM_3" .. player.dwID
		local szName4 = "FXF_XM_4" .. player.dwID
		local npc1 = scene.GetNpcByNickName(szName1)
		local npc2 = scene.GetNpcByNickName(szName2)
		local npc3 = scene.GetNpcByNickName(szName3)
		local npc4 = scene.GetNpcByNickName(szName4)
		if npc1 and npc2 and npc3 and npc4 then
			local tZ_yutou = {
				npc1.nZ,
				npc2.nZ,
				npc3.nZ,
				npc4.nZ,
				player.nZ,
			}
			table.sort(tZ_yutou)
			local nNum = math.abs(tZ_yutou[5] - tZ_yutou[1])
			if nNum >= 150 then
				--��᫣�������
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 425), 4)
				player.ClearCDTime(1025)
				return
			else
				--�������޼�ش���---------
				local npc_yutou = scene.GetNpcByNickName("yutou20160226")
				if npc_yutou then
					local nValueNow = npc_yutou.GetCustomUnsigned4(0)
					if nValueNow <= 200 then
						npc_yutou.SetCustomUnsigned4(0, nValueNow + 1)
						npc_yutou.SetDisappearFrames(120*16, 0)
					else
						--��ʾ���ܴ���
						RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 8906), 4)
						player.ClearCDTime(1025)
						return
					end
				else
					scene.CreateNpc(50946, 2,2,2,0,120 * 16,"yutou20160226")
					local npc_yutou2 = scene.GetNpcByNickName("yutou20160226")
					if npc_yutou2 then
						npc_yutou2.SetCustomUnsigned4(0, 1)
					end
				end
				-----------------------------
				
				player.AddBuff(0, 99, 10507, 1, 122)
				
				if player.GetSingleRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND) == 321 then
					player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 0)
				end
			
				--����NPC--��̯
				local nA = 0 --���ƫ�ƽǶ�
				local nL = 1 * 64 --���ƫ�ƾ���
				local dwX_npc_mt,dwY_npc_mt,dwF_npc_mt = GetPoint_xyf(player.nX,player.nY,player.nFaceDirection,nA,nL)
				
				local npcX = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
				if not npcX then
					scene.CreateNpc(50907, dwX_npc_mt, dwY_npc_mt, npc1.nZ, dwF_npc_mt, 125 * 16, "mt_fxf0216_" .. player.dwID) --���5���Ա�AI����
					
					local npcX = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
					if npcX then
						local nNpcOffset = 0
						npcX.SetCustomUnsigned4(nNpcOffset, player.dwID)--д�������ߵ�ID

						local nA_xm1 = 36 --���ƫ�ƽǶ�
						local nL_xm1 = 2 * 64 --���ƫ�ƾ���
						local dwX_POINT2,dwY_POINT2,dwF_POINT2 = GetPoint_xyf(dwX_npc_mt,dwY_npc_mt,dwF_npc_mt,nA_xm1,nL_xm1)

						local npcZ = scene.GetNpcByNickName("xmw_fxf0216_" .. player.dwID)
						if not npcZ then
							scene.CreateNpc(50947, dwX_POINT2, dwY_POINT2, player.nZ + 30, dwF_POINT2, 125 * 16, "xmw_fxf0216_" .. player.dwID)
						end
						
						local nA_xm2 = -32 --���ƫ�ƽǶ�
						local nL_xm2 = 2 * 64 --���ƫ�ƾ���
						local dwX_POINT1,dwY_POINT1,dwF_POINT1 = GetPoint_xyf(dwX_npc_mt,dwY_npc_mt,dwF_npc_mt,nA_xm2,nL_xm2)
						local npcY = scene.GetNpcByNickName("xmm_fxf0216_" .. player.dwID)
						if not npcY then
							scene.CreateNpc(50946, dwX_POINT1, dwY_POINT1, player.nZ + 30, dwF_POINT1, 125 * 16, "xmm_fxf0216_" .. player.dwID)
						end
					end
				end
				--[[				
				local nValueZ = 400
				
				--����Doodad * 2
				local npcX = scene.GetNpcByNickName("mt_fxf0216_" .. player.dwID)
				local nA_xm3 = -10 --���ƫ�ƽǶ�
				local nL_xm3 = 0.5 * 64 --���ƫ�ƾ���
				local dwX_POINT3, dwY_POINT3, dwF_POINT3 = GetPoint_xyf(dwX_npc_mt, dwY_npc_mt, dwF_npc_mt, nA_xm3, nL_xm3)

				local nA_xm4 = 45--���ƫ�ƽǶ�
				local nL_xm4 = 0.9 * 64 --���ƫ�ƾ���
				local dwX_POINT4, dwY_POINT4, dwF_POINT4 = GetPoint_xyf(dwX_npc_mt, dwY_npc_mt, dwF_npc_mt, nA_xm4, nL_xm4)
				
				local doodad1 = scene.GetDoodadByNickName("mw1_fxf" .. player.dwID)
				local doodad2 = scene.GetDoodadByNickName("mw2_fxf" .. player.dwID)
				if not doodad1 and not doodad2 then
					local doodad_1 = scene.CreateDoodad(6012, dwX_POINT3, dwY_POINT3, npc1.nZ + nValueZ, dwF_POINT3, "mw1_fxf" .. player.dwID)
					if doodad_1 then
						doodad_1.SetDisappearFrames(120 * 16, 0)
						doodad_1.SetCustomUnsigned4(0, npcX.dwID) --0��ƫ��ֵ�ϣ�����NPCID�Ĵ洢
					end
					local doodad_2 = scene.CreateDoodad(6012, dwX_POINT4, dwY_POINT4, npc1.nZ + nValueZ, dwF_POINT4, "mw2_fxf" .. player.dwID)
					if doodad_2 then
						doodad_2.SetDisappearFrames(120 * 16, 0)
						doodad_2.SetCustomUnsigned4(0, npcX.dwID) --0��ƫ��ֵ�ϣ�����NPCID�Ĵ洢
					end
				end
				--]]
			end
		end
	end
end

function GetPoint_xyf(nX,nY,nF,nA,nL)
	local nA_xm1 = nA --���ƫ�ƽǶ�
	local nL_xm1 = nL --���ƫ�ƾ���
	local nH_xm1 = ((nF + nA) / 256 * 360) / 360 * 2 * math.pi
	local nX_New = nX + (nL_xm1) * math.cos(nH_xm1)
	local nY_New = nY + (nL_xm1) * math.sin(nH_xm1)
	local nF_New = nF
	return nX_New,nY_New,nF_New
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com