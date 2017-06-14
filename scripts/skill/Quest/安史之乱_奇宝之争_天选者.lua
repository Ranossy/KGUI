---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��ʷ֮��_�汦֮��_��ѡ��.lua
-- ����ʱ��:	2013/10/22 20:26:40
-- �����û�:	LILIN1-PC
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
Include("scripts/Map/Ұ������/�汦֮��/include/�汦֮��_Data.lh")

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
	--[[
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- ��������ģʽ
   		ATTRIBUTE_TYPE.nAttributeKey,								-- ħ������
   		nAttributeValue1,											-- ����ֵ1
   		nAttributeValue2											-- ����ֵ2
   		);
    --]]
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	
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
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
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
    
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
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
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
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
	skill.nWeaponDamagePercent = 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
--2017.1.12�������滻--
--[[
local tDelNPC = {--
	[6] = {
		{0, 0, 0, 0, 0, "WBJYR_yz", true},
	},
	[108] = {
		{0, 0, 0, 0, 0, "WBJYR_cd", true},
	},
	[194] = {
		{0, 0, 0, 0, 0, "WBJYR_ty", true},
	},
}
--]]	
function OnRemove(dwCharacterID, dwBuffID, nBuffLevel, nLeftFrame)
	
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.GetBuff(8207, 1) then
		player.DelBuff(8207, 1)
	end
	
	player.SetDynamicSkillGroup(0)
	
	local scene = player.GetScene()
	if not scene then
		return
	end
	
	scene.UnbindMapMarkByPlayer(dwCharacterID)
	
	if player.GetBuff(Wild_Treasure.BuffList.Defend.dwBuffID, Wild_Treasure.BuffList.Defend.nBuffLevel) then
		player.DelBuff(Wild_Treasure.BuffList.Defend.dwBuffID, Wild_Treasure.BuffList.Defend.nBuffLevel)
	end
	if player.GetBuff(Wild_Treasure.BuffList.TopHead.dwBuffID, Wild_Treasure.BuffList.TopHead.nBuffLevel) then
		player.DelBuff(Wild_Treasure.BuffList.TopHead.dwBuffID, Wild_Treasure.BuffList.TopHead.nBuffLevel)
	end
	if player.GetBuff(Wild_Treasure.BuffList.PercentCure.dwBuffID, Wild_Treasure.BuffList.PercentCure.nBuffLevel) then
		player.DelBuff(Wild_Treasure.BuffList.PercentCure.dwBuffID, Wild_Treasure.BuffList.PercentCure.nBuffLevel)
	end
	
	local npc_Control = Wild_Treasure.GetNpcControl(scene)
	if not npc_Control then
		WildTreasureErrorOption(player)
		player.SendSystemMessage(GetEditorString(6, 1052))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(6, 1053), 4)
		return
	end
	
	local dwOwnerID = Wild_Treasure.GetOwnerPlayerID(npc_Control)
	if dwCharacterID ~= dwOwnerID then
		WildTreasureErrorOption(player)
		player.SendSystemMessage(GetEditorString(6, 1052))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(6, 1053), 4)
		return
	end
	
	local dwState = Wild_Treasure.GetActivityState(npc_Control)
	
	if nLeftFrame ~= 0 then
		if dwState ~= 1 then
			return
		end
		
		WildTreasureErrorOption(player)
		
		player.SendSystemMessage(GetEditorString(6, 787))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_WARNING_RED", GetEditorString(6, 791), 4)
		
		Wild_Treasure.CreateLostBox(scene, player.nX, player.nY, player.nZ)
		
		return
	end
		
	-- ��������buff
	local buff_Box = player.GetBuff(Wild_Treasure.BuffList.OpenBox.dwBuffID, Wild_Treasure.BuffList.OpenBox.nBuffLevel)
	if not buff_Box then
		player.AddBuff(0, 99, Wild_Treasure.BuffList.OpenBox.dwBuffID, Wild_Treasure.BuffList.OpenBox.nBuffLevel, 7 * 24 * 3600 / 2)
		buff_Box = player.GetBuff(Wild_Treasure.BuffList.OpenBox.dwBuffID, Wild_Treasure.BuffList.OpenBox.nBuffLevel)
	end
	
	buff_Box.nCustomValue = #Wild_Treasure.HoldTime
	
	local szString = string.format(GetEditorString(6, 994), player.szName, Wild_Treasure.HoldTime[#Wild_Treasure.HoldTime])
	
	npc_Control.SetCustomUnsigned1(Wild_Treasure.Control.ValueName.dwRewardLevel, #Wild_Treasure.HoldTime)
	npc_Control.SetCustomUnsigned1(Wild_Treasure.Control.ValueName.dwState, 2)
	npc_Control.FireAIEvent(Wild_Treasure.Control.AIEndEvent, 0, 0)
	
	UpdateStatData("OpenWildTreasure|" .. scene.dwMapID, 1)
	
	local szTongName = Wild_Treasure.GetOwnerTongName(npc_Control)
	szString = string.format(
		GetEditorString(6, 995),
		szTongName, player.szName, Wild_Treasure.HoldTime[#Wild_Treasure.HoldTime]
	)
	
	SendGlobalSysMsg(szString)
	SendGlobalSysMsg(szString, ANNOUNCE_SHOW_TYPE.SCROLL_BOX)
	
	player.PlaySfx(611, player.nX, player.nY, player.nZ)
	player.PlaySfx(613, player.nX, player.nY, player.nZ)
	player.PlaySfx(622, player.nX, player.nY, player.nZ)
	player.CastSkill(8487, 1)
	player.SendSystemMessage(GetEditorString(6, 996) .. Wild_Treasure.HoldTime[#Wild_Treasure.HoldTime] .. GetEditorString(6, 997))
	RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_ADVERT_GREEN", GetEditorString(6, 793), 4)
	--[[  --2017.1.12�������滻
	------------�������������ڼ���ս�ؾ���ʱ����NPC----------------
	if scene.dwMapID == 215 then
		--	RemoteCallToCenter("On_Activity_DelDungeonQueneNpc")
		RemoteCallToCenter("On_Activity_DeleteNPC",tDelNPC)
	end
	-----------------NPC���ս���---------------------------------
	--]]
end

function WildTreasureErrorOption(player)
	local nAmount = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, Wild_Treasure.BoxItemID)
	if nAmount > 0 then
		player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, Wild_Treasure.BoxItemID, nAmount)
	end
	
	if player.GetBuff(Wild_Treasure.BuffList.Protect.dwBuffID, Wild_Treasure.BuffList.Protect.nBuffLevel) then
		player.DelBuff(Wild_Treasure.BuffList.Protect.dwBuffID, Wild_Treasure.BuffList.Protect.nBuffLevel)
	end
	if player.GetBuff(Wild_Treasure.BuffList.OpenBox.dwBuffID, Wild_Treasure.BuffList.OpenBox.nBuffLevel) then
		player.DelBuff(Wild_Treasure.BuffList.OpenBox.dwBuffID, Wild_Treasure.BuffList.OpenBox.nBuffLevel)
	end
	if player.GetBuff(Wild_Treasure.BuffList.CheckStealth.dwBuffID, Wild_Treasure.BuffList.CheckStealth.nBuffLevel) then
		player.DelBuff(Wild_Treasure.BuffList.CheckStealth.dwBuffID, Wild_Treasure.BuffList.CheckStealth.nBuffLevel)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com