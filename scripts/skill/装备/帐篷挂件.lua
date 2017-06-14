---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/����Ҽ�.lua
-- ����ʱ��:	2014/11/20 22:43:39
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ����
-- ����ʱ��	:  2007-12-11
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/����Ҽ�.lua",
		0
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 536);
	skill.SetCheckCoolDown(1, 681);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if player.dwBackItemIndex ~= 13126 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		return false
	end

	if player.dwModelID ~= 0 then -- ����ǲ��ǻ�װ��
		return false
	end

	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		return false
	end
	if player.bFightState then
		return false
	end
	
	if player.bOnHorse then
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
	if not CustomFunction.CheckPlayerForRepresentApply(player) then
		return
	end
	if player.dwBackItemIndex ~= 13126 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		return
	end
	
	for i = 1, 100 do
		player.DelGroupBuff(409, i)--����ɾ��
	end
	
	local scene = player.GetScene()
	
	--------------------------��������ֲ�������ϵ��ٻ�����--------------------------
	if player.nMoveState == MOVE_STATE.ON_DEATH then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(0, 1399), 4)
		player.SendSystemMessage(GetEditorString(0, 112))
		return
	end

	if scene.nType == MAP_TYPE.DUNGEON or scene.nType == MAP_TYPE.BATTLE_FIELD or scene.dwMapID == 25 or scene.dwMapID == 27 then
		player.SendSystemMessage(GetEditorString(6, 1299))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 1315), 4)
		return
	end


	local dwMapID = scene.dwMapID
	
	--�ڳ������ٻ�
	if dwMapID == 172 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 441), 3)
		return
	end
	
	if dwMapID == 6 then--����
		if (player.nX > 43305 and player.nY > 54703) or (player.nX > 62571 and player.nY > 49799) then 
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 442), 5)
			return
		end
	end	
	
	if dwMapID == 8 then--����
		if (player.nX > 11328 and player.nX < 25845 and player.nY > 80675) 
			or (player.nX >= 25845 and player.nX < 45595 and player.nY > 68267) then 
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 443), 5)
			return
		end
	end

	if dwMapID == 15 then--����
		if (player.nX > 34859 and player.nX < 66897 and player.nY > 87317) then 
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 444), 5)
			return
		end
	end	
	
	if dwMapID == 108 then--�ɶ�
		if (player.nX > 55204 and player.nX < 75576 and player.nY > 58997 and player.nY < 74838) then 
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(7, 445), 5)
			return
		end
	end	
		
		
	local buff_keren = player.GetBuff(8659, 1)
	if buff_keren then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 434), 4)
		return
	end
	
	local buff_zhuren = player.GetBuff(8660, 1)
	if buff_zhuren then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 435), 4)
		player.SetDynamicSkillGroup(184)
		return
	end
	
	--if not player.GetBuff(7194, 1) then
		local NPCszName = scene.GetNpcByNickName("zp_yutou_" .. player.dwID)
		if not NPCszName then
			--player.SelectPendent(EQUIPMENT_SUB.BACK_EXTEND, 0)  --ж�±����Ҽ�
			--player.SelectPendent(EQUIPMENT_SUB.BACK_EXTEND, 13126)
			player.AddBuff(0, 99, 8640, 1, 10) --���
		--	player.AddBuff(0, 99, 7194, 1) --CD
			local scene = player.GetScene()
			scene.CreateNpc(41160, player.nX + 70, player.nY + 70, player.nZ, 0, 16 * 2, "YUTOU_DM_1_" .. player.dwID)
			scene.CreateNpc(41160, player.nX - 70, player.nY - 70, player.nZ, 0, 16 * 2, "YUTOU_DM_2_" .. player.dwID)
			scene.CreateNpc(41160, player.nX - 70, player.nY + 70, player.nZ, 0, 16 * 2, "YUTOU_DM_3_" .. player.dwID)
			scene.CreateNpc(41160, player.nX + 70, player.nY - 70, player.nZ, 0, 16 * 2, "YUTOU_DM_4_" .. player.dwID)
			--���״̬~= վ��
			--��ͷ������
			--���BUFF
			--������BUFF
			player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/װ��/����Ҽ�.lua", 0, 0)
			
			--player.ResetCD()
		else
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 424), 4)
			return
		end
	--else
	--	RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", "������ʿ�Ե�Ƭ��", 4)
	--	return
	--end
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
		local szName1 = "YUTOU_DM_1_" .. player.dwID
		local szName2 = "YUTOU_DM_2_" .. player.dwID
		local szName3 = "YUTOU_DM_3_" .. player.dwID
		local szName4 = "YUTOU_DM_4_" .. player.dwID
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
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 425), 4)
				player.DelBuff(8640, 1) --���
				player.DelBuff(8659, 1)--������
				return
			else
				player.SelectPendent(EQUIPMENT_SUB.BACK_EXTEND, 0)
				scene.CreateNpc(41159, player.nX, player.nY, player.nZ, player.nFaceDirection, 10 * 16, "YUTOU1120_ZP_1_" .. player.dwID)
				local npcX = scene.GetNpcByNickName("YUTOU1120_ZP_1_" .. player.dwID)
				if npcX then
					npcX.SetCustomUnsigned4(0, player.dwID)
				end
		
				player.Stop()
			--	player.AddBuff(0, 99, 8659, 1, 900)--������
				player.AddBuff(0, 99, 8640, 1, 900) --���
			--	player.DoAction(0, 10107)
			--	player.PlaySfx(1087, 0, 0, 0)
				player.SetDynamicSkillGroup(184)
				--player.PlaySfx(1087,0,0,0)
				player.SetTimer(0.7 * GLOBAL.GAME_FPS, "scripts/skill/װ��/����Ҽ�.lua", nParam1 + 1, 0)
				return
			end
		end
	end
	if nParam1 == 1 then
		player.PlaySfx(1087, 0, 0, 0)
		player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/װ��/����Ҽ�.lua", nParam1 + 1, 0)
		return
	end
	if nParam1 >= 2 then
		if nParam1 == 2 then
			--player.PlaySfx(1087, 0, 0, 0)
			player.AddBuff(0, 99, 8659, 1, 900)--������
			player.DoAction(0, 10107)
			player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/װ��/����Ҽ�.lua", nParam1 + 1, 0)
			return
		end
		local buff1 = player.GetBuff(8640, 1)--���
		if not buff1 then
			player.DelBuff(8659, 1)--������
			player.SetDynamicSkillGroup(0)
			player.DoAction(0, 10107)
			player.Jump(true, 0)
			return
		end
		
		local buff2 = player.GetBuff(8659, 1)--����
		if not buff2 then
			player.DelBuff(8640, 1)--���
			player.SetDynamicSkillGroup(0)
			player.DoAction(0, 10107)	
			player.Jump(true, 0)
			return
		end
		--player.AddBuff(0, 99, 8640, 1, 3600) --���
		--player.AddBuff(0, 99, 8659, 1, 3600)

		--player.SelectPendent(EQUIPMENT_SUB.BACK_EXTEND, 0)
		local szZHANGPENG = "YUTOU1120_ZP_1_" .. player.dwID
		local npc = scene.GetNpcByNickName(szZHANGPENG)
		if npc then
			npc.SetDisappearFrames(3 * 16, false)
		else
			player.DelBuff(8640, 1)--���
			player.DelBuff(8659, 1)--������
			player.DelBuff(8660, 1)--����
			player.SetDynamicSkillGroup(0)
			player.DoAction(0, 10107)	
			player.Jump(true, 0)
			return
		end
 
		if buff2.nCustomValue ~= 0 then
			local p_keren = GetPlayer(buff2.nCustomValue)
			if not p_keren then
	--			print(200001)
				buff2.nCustomValue = 0
			else
				local buff_ke = p_keren.GetBuff(8640, 1)--����ر��λ
				if not buff_ke then
			--		print(200002)
					buff2.nCustomValue = 0
				else
					if buff_ke.nCustomValue ~= player.dwID then
						buff2.nCustomValue = 0
				--		print(200003)	
					end
				end
			end
		end
		
		--player.AddBuff(0, 99, 8640, 1, 6000) --���
		--player.AddBuff(0, 99, 8659, 1, 6000)--������
		player.SetDynamicSkillGroup(184)
		player.SetTimer(1 * GLOBAL.GAME_FPS, "scripts/skill/װ��/����Ҽ�.lua", nParam1 + 1, 0)
		return
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com