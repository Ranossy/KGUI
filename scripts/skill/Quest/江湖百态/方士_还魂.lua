---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/��ʿ_����.lua
-- ����ʱ��:	2016/6/8 16:59:09
-- �����û�:	wangwei2
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Domesticate/FellowPet.lua")
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/������̬/include/IdentityBaseFunc.lua")
Include("scripts/Map/Ѱ��ϵͳ/include/HoroSystem.lua")
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
----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/Quest/������̬/��ʿ_����.lua", -- ����ֵ1
		0														-- ����ֵ2
	)

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

	-----------------����ʩ����̬����(����)----------------------------------------
	--skill.nNeedPoseState = 1    --�����̬��1Ϊ�浶��̬��2Ϊ�����̬

	----------------�����˺���С�ӻ�Ѫ------------------------------------------

	--skill.nDamageToLifeForParty = 0	--�����˺���С�ӳ�Ա�ٷֱȻ�Ѫ

	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 1057);	--������ͨCD��
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	--skill.nCostManaBasePercent = 0;							-- �������ĵ������ٷֱ�
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- ����Ϊtrueʱ,��ʾȫ�����Ķ���
	--skill.nNeedAccumulateCount = 0;				-- ������Ҫ����ĸ�������skill.bIsAccumulate	= trueʱ��Ч
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	--skill.nMaxRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	--skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 32;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
	--skill.bInstantChannel = false;				-- ͨ�������Ƿ��������һ���˺�
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
	--skill.nWeaponDamagePercent = 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local scene = player.GetScene()
	if not scene then
		return SKILL_RESULT_CODE.FAILED
	end

	--��ֹͨ��/cast �����붨 �ظ�ʹ�ü���
	if not player.GetBuff(10827,1) then
		return SKILL_RESULT_CODE.FAILED
	end
	
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	--�������������������
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--������������ͳ����ҵ��α�����ڱ�����
	local buffChest = player.GetBuff(10826, 1)
	if buffChest then
		--player.GetPlayerIdentityManager().LogIdentityClosed(3, buffChest.nCustomValue)
	end
	--���BUFFӦ�����뿪��̬�������ű���-------
	--���еĻع鶼������ʱ���ű�����ͳһ����
	--player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/��ʿ_����.lua", 0, 1)
	player.DelBuff(10827, 1)
	if player.GetBuff(11494, 1) then
		player.DelBuff(11494, 1) --ɾ����ʿ��͸��buff
	end
	if player.GetBuff(2587, 1) then
		player.DelBuff(2587, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	if not scene then
		return
	end
	local IdentifyManager = player.GetPlayerIdentityManager()
	if not IdentifyManager then
		return
	end
	
	if nParam2 == 1 then
		--����
		--RemoteCallToClient(player.dwID, "EnableColorShift", false)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "PlayBgMusic", GetEditorString(10, 2197), nil, 2)  --ȡ��������������
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "BgMusic_TryPlayBack")
		--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "reset default environment")	-- ��ԭ��պ�
		--RemoteCallToClient(player.dwID, "On_Trial_Screen_Black")
		--RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "ShowFullScreenSFX", "WIZARD_VISIABLE_CLOSE")
		RemoteCallToClient(player.dwID, "SceneSfx", "Delete", "WIZARD_VISIABLE_OPEN")
		RemoteCallToClient(player.dwID, "SceneSfx", "Insert", {key = "WIZARD_VISIABLE_CLOSE", sfxid = "WIZARD_VISIABLE_CLOSE", px = -0.5, py = -0.2, pw = 2.0, ph = 1.4, loop = false})	
		player.SetTimer(2.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/��ʿ_����.lua", nParam1, 2)

		-- �򿪳���ǰ������õ�Ӱ��Ч��
		RemoteCallToClient(player.dwID, "Restore3DOption", "IdentityWizard")	
	elseif nParam2 == 2 then    --���屻ɱ������ʱ�������������
		if player.GetBuff(2587, 1) then
			player.DelBuff(2587, 1)
		end
		--ͨ�õ��ߡ�buff��������
		local tDelItemList = {
			27092, 27147,
		}
		for _, nItemId in pairs(tDelItemList) do
			local nAmount = player.GetItemAmountInAllPackages(5, nItemId)
			if nAmount >= 1 then
				player.CostItemInAllPackage(5, nItemId, nAmount)
			end
		end
		local tDelQuestList = {
			15738, 15792, 15765,
		}
		for _, nQuestId in pairs(tDelQuestList) do
			local nQuestIndex = player.GetQuestIndex(nQuestId)
			if nQuestIndex then
				player.SetQuestFailedFlag(nQuestIndex, 1)
			end
		end
		local tDelBuffList = {
			11128,
		}
		for _, nBuffId in pairs(tDelBuffList) do
			local buffDel = player.GetBuff(nBuffId, 1)
			if buffDel then
				player.DelBuff(nBuffId, 1)
			end
		end
		
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "SetBalloonGray", false)	-- ȡ���������ݻ�ɫ
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "reset default environment")	-- ��ԭ��պ�
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "leave camera Post render")
		
		--�л�������ʱ,���״̬���BUFF�ͽ�ֹ����BUFF���Ѿ���ɾ����
		if IdentifyManager.dwCurrentIdentityType == PLAYER_IDENTITY_TYPE.WIZARD then     --��������Ƿ�ʿ��ݣ������ӻض�̬��������
			local nExp = IdentifyManager.GetIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD)                 --��ȡ��ݾ��飬						
			local nIdentifyLevel = GetIdentityLevel(PLAYER_IDENTITY_TYPE.WIZARD, nExp)
			if nIdentifyLevel > 1 then
				--player.SetDynamicSkillGroup(263)
				RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", 3002)
			else
				local nQuestId_15462 = 15462 --һ���Խ�ѧ����
				local nQuestIndex_15462 = player.GetQuestIndex(nQuestId_15462)
				local nQuestPhase_15462 = player.GetQuestPhase(nQuestId_15462)
				if nQuestIndex_15462 and nQuestPhase_15462 == 1 then
					--player.SetDynamicSkillGroup(263)
					RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", 3002)
				else
					--player.SetDynamicSkillGroup(294)
					RemoteCallToClient(player.dwID, "OpenIdentityDynActBar", 3001)
				end
			end
			if scene.nType ~= 0 then
				--player.SetDynamicSkillGroup(0)        --��Ȼ�Ƿ�ʿ,���ҳ������Ͳ���,��ն�̬������				
				RemoteCallToClient(player.dwID, "CloseIdentityDynActBar")				
			end

			--�»��Ʊ����ֶ����BUFF��λ����Ϣ
			if player.GetBuff(10826, 1) then
				player.DelBuff(10826, 1)
			end
			if player.GetBuff(10827, 1) then
				player.DelBuff(10827, 1)
			end
			if player.GetBuff(11494, 1) then
				player.DelBuff(11494, 1) --ɾ����ʿ��͸��buff
			end
			if player.GetBuff(2587, 1) then
				player.DelBuff(2587, 1)
			end			
			player.SetIdentityVisiableID(0)

		end
		local x = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 1)
		local y = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 5)
		local z = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 9)
		local mapID = IdentifyManager.GetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 13)
		if scene.dwMapID == mapID then    --��ͬһ�����²Żᴫ��
			if x > 0 and y > 0 and z > 0 then				
				--player.SetPosition(npc.nX, npc.nY, npc.nZ)
				if player.GetBuff(11438, 1) then -- ��BOSS��쳾���ܲ��������Ӵ�buff��ֱ��ԭ�س�������
					player.DelBuff(11438, 1)
				else
					player.SetPosition(x, y, z)
				end
			end	
			local nFace = IdentifyManager.GetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 17)
			if nFace then
				--������ͷ�����������ǰһ��
				player.TurnTo(nFace)  	
				RemoteCallToClient(player.dwID, "OnChangeCameraYaw", nFace)
			end
		end

		--�����ݱ����Ĵ洢����͵�ͼ��
		IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 1, 0)
		IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 5, 0)
		IdentifyManager.SetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 9, 0)
		IdentifyManager.SetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 13, 0)
		IdentifyManager.SetCustomInteger2(PLAYER_IDENTITY_TYPE.WIZARD, 15, 0)
	
		if nParam1 > 1 then
			if GetPlayer(nParam1) then
				player.dwFirstAttackPlayer = nParam1
				player.DieByKiller(nParam1)			
			else
				player.Die()
			end	
		elseif nParam1 == 1 then
			player.Die()
		end
				
		--��ѧ����
		local tQuestId = {15462, 15741}
		for _, nQuestId in pairs(tQuestId) do
			local nQuestIndex = player.GetQuestIndex(nQuestId)
			local nQuestPhase = player.GetQuestPhase(nQuestId)
			if nQuestIndex and nQuestPhase == 1 then
				player.SetQuestValue(nQuestIndex, 0, 1)
			end
		end
		--����������
		local nQuestId_15460 = 15460
		local nQuestIndex_15460 = player.GetQuestIndex(nQuestId_15460)
		local nQuestPhase_15460 = player.GetQuestPhase(nQuestId_15460)
		if nQuestIndex_15460 and nQuestPhase_15460 == 1 then
			player.SetQuestValue(nQuestIndex_15460, 2, 1)
		end
		--�ٻ���ʵ�������ٳ���NPC����
		local npcPet = scene.GetNpcByNickName("IdentityWizardLight" .. player.dwID)
		if npcPet then
			npcPet.SetDisappearFrames(1)
		end
		--[[
		local nFellowPetIndex = 208
		if player.IsFellowPetAcquired(nFellowPetIndex) then
			local dwPetId = player.dwFellowPetID
			local npc_pet = GetNpc(dwPetId)
			if not npc_pet then
				local dwNpcTemplateID = 51727
				OnCreateFellowPet(player, dwNpcTemplateID, nFellowPetIndex)
			end
		end
		--]]
	    local nQuestId_15784 = 15784
		local nQuestIndex_15784 = player.GetQuestIndex(nQuestId_15784)
		local nQuestPhase_15784 = player.GetQuestPhase(nQuestId_15784)
		if nQuestIndex_15784 and nQuestPhase_15784 == 1 then
			if player.GetItemAmount(5, 27134) == 1 then
				player.CostItemInAllPackage(5, 27134, 1)
			end
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(11, 1202), 4)
		end
		--RemoteCallToClient(player.dwID, "SceneSfx", "Delete", "WIZARD_VISIABLE_CLOSE")
		--RemoteCallToClient(player.dwID, "SceneSfx", "Delete", "WIZARD_VISIABLE_OPEN")
		-- �ڱ�����ʱ����
		local npc_Dig = scene.GetNpcByNickName("IdentityWizardDig" .. player.dwID)
		if npc_Dig then
			local nType = npc_Dig.GetCustomUnsigned1(0)
			if nType == 1 then
				RemoteCallToClient(player.dwID, "OpenSpringCompass")	-- ��/�ر��ڱ�����
				RemoteUpdateLocData(player)
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com