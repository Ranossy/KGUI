---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��Ѫ��_�⹦.lua
-- ����ʱ��:	2014/6/30 17:28:35
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  �ź�
-- ����ʱ��	:  2011-8-16
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 27 * 0.95, nDamageRand = 27 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 37 * 0.95, nDamageRand = 37 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 63 * 0.95, nDamageRand = 63 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 90 * 0.95, nDamageRand = 90 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 131 * 0.95, nDamageRand = 131 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 172 * 0.95, nDamageRand = 172 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 236 * 0.95, nDamageRand = 236 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 282 * 0.95, nDamageRand = 282 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 327 * 0.95, nDamageRand = 327 * 0.1, nCostMana = 0}, --level 9
	{nDamageBase = 334 * 0.95, nDamageRand = 334 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 337 * 0.95, nDamageRand = 337 * 0.1, nCostMana = 0}, --level 11
	{nDamageBase = 363 * 0.95, nDamageRand = 363 * 0.1, nCostMana = 0}, --level 12
	{nDamageBase = 390 * 0.95, nDamageRand = 390 * 0.1, nCostMana = 0}, --level 13
	{nDamageBase = 431 * 0.95, nDamageRand = 431 * 0.1, nCostMana = 0}, --level 14
	{nDamageBase = 472 * 0.95, nDamageRand = 472 * 0.1, nCostMana = 0}, --level 15
	{nDamageBase = 536 * 0.95, nDamageRand = 536 * 0.1, nCostMana = 0}, --level 16
	{nDamageBase = 582 * 0.95, nDamageRand = 582 * 0.1, nCostMana = 0}, --level 17
	{nDamageBase = 627 * 0.95, nDamageRand = 627 * 0.1, nCostMana = 0}, --level 18
	{nDamageBase = 634 * 0.95, nDamageRand = 634 * 0.1, nCostMana = 0}, --level 19
	{nDamageBase = 637 * 0.95, nDamageRand = 637 * 0.1, nCostMana = 0}, --level 20
	{nDamageBase = 663 * 0.95, nDamageRand = 663 * 0.1, nCostMana = 0}, --level 21
	{nDamageBase = 690 * 0.95, nDamageRand = 690 * 0.1, nCostMana = 0}, --level 22
	{nDamageBase = 731 * 0.95, nDamageRand = 731 * 0.1, nCostMana = 0}, --level 23
	{nDamageBase = 772 * 0.95, nDamageRand = 772 * 0.1, nCostMana = 0}, --level 24
	{nDamageBase = 836 * 0.95, nDamageRand = 836 * 0.1, nCostMana = 0}, --level 25
	{nDamageBase = 882 * 0.95, nDamageRand = 882 * 0.1, nCostMana = 0}, --level 26
	{nDamageBase = 927 * 0.95, nDamageRand = 927 * 0.1, nCostMana = 0}, --level 27
	{nDamageBase = 934 * 0.95, nDamageRand = 934 * 0.1, nCostMana = 0}, --level 28
	{nDamageBase = 937 * 0.95, nDamageRand = 937 * 0.1, nCostMana = 0}, --level 29
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(												
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/��Ѫ��_�⹦.lua", --����ֵ1
		0										--����ֵ2
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(3200, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	skill.BindBuff(1, 2237, dwSkillLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 468);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
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
	skill.nMaxRadius = 30 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 48*1.05;
	elseif dwSkillLevel < 19 then
		skill.nChannelInterval = (48 + (dwSkillLevel - 9) * 20)*1.05
	else
		skill.nChannelInterval = 245*1.05;     -- ͨ�������ʱ��
	end

	--skill.nChannelInterval	= 288; 				-- ͨ�������ʱ��
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
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID,dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end

	--��S_9298��Ѫ�ڻ�����
	if player.GetSkillLevel(9297) == 1 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(9298, 1,TARGET.PLAYER,dwCharacterID)
		else
			player.CastSkill(9298, 1,TARGET.NPC,dwCharacterID)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com