---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���Ź�֮��/���Ź�֮��_���ﺣ_�籩_�ںϷ籩.lua
-- ����ʱ��:	2014/7/30 14:41:24
-- �����û�:	renjei1
-- �ű�˵��:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���Ź�֮��/���Ź�֮��_���ﺣ_�籩_�ںϷ籩.lua
-- ����ʱ��:	2014/7/14 16:54:10
-- �����û�:	renjei1
-- �ű�˵��:
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 39100, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 1
	{nDamageBase = 400, nDamageRand = 50 * 0.4, nCostMana = 0}, --level 2
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 3
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 4
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 5
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 6
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 7
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 8
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 9
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 10
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 11
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 12
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 13
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 14
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 15
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 16
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 17
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 18
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 19
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 20
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 21
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 22
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 23
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 24
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 25
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 26
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 27
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 28
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 29
	{nDamageBase = 3200 * 0.8, nDamageRand = 3200 * 0.4, nCostMana = 0}, --level 30
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase * 0.14,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * 0.14,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/npc/����BOSS/���Ź�֮��/���Ź�֮��_���ﺣ_�籩_�ںϷ籩.lua",
		0
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 8053, 1);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

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
	skill.nHeight = 6 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames = 8;				-- ����֡��
	--skill.nChannelInterval = 16; 				-- ͨ�������ʱ��
	--skill.nChannelFrame = 240;	 			-- ͨ��������ʱ�䣬��λ֡��
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
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	skill.nBrokenRate = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
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
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcId)
	local npcStorm = GetNpc(dwSkillSrcId)
	local playerT = GetPlayer(dwCharacterID)
	local scene = playerT.GetScene()
	if not scene then
		return
	end
	
	if playerT then
		playerT.PlaySfx(635, playerT.nX, playerT.nY, playerT.nZ)
	end
	
	--local npcBoss = scene.GetNpcByNickName("wudi")

	if scene.dwMapID == 195 then
		if playerT and playerT.nMoveState ~= MOVE_STATE.ON_DEATH then
			if not playerT.GetBuff(8336, 1) then
				playerT.AddBuff(0, 99, 8336, 1, 5)
			end
		end
		
		local npcStorm = GetNpc(dwSkillSrcId)
		if npcStorm and npcStorm.GetCustomBoolean(5) == false then
			npcStorm.SetDisappearFrames(48, 0)
			npcStorm.SetCustomBoolean(5, true)
		end
	end

	if scene.dwMapID == 196 then
		if playerT and playerT.nMoveState ~= MOVE_STATE.ON_DEATH then
			if not playerT.GetBuff(8336, 2) then
				playerT.AddBuff(0, 99, 8336, 2, 5)
			end
		end
		
		local npcStorm = GetNpc(dwSkillSrcId)
		if npcStorm and npcStorm.GetCustomBoolean(5) == false then
			npcStorm.SetDisappearFrames(48, 0)
			npcStorm.SetCustomBoolean(5, true)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
--function OnTimer(player, p1, p2)
--local playerT = player
--local dwCharacterID = p1
--local dwSkillSrcId = p2
--local npcStorm = GetNpc(dwSkillSrcId)
--if npcStorm then
--print("��ʧ")
--npcStorm.SetDisappearFrames(48, 0)
--else
--playerT.DelBuff(8176, 1)
--end
--end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com