---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�����/ҽ��/95��ҽ��ͨ��.lua
-- ����ʱ��:	2015/8/31 17:38:35
-- �����û�:	mantong2
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
	{nDamageBase = 9602, nDamageRand = 1, nCostMana = 0}, --level 1 --������
	{nDamageBase = 9604, nDamageRand = 1, nCostMana = 0}, --level 2 --��ǵ�
	{nDamageBase = 9605, nDamageRand = 1, nCostMana = 0}, --level 3 --����
	{nDamageBase = 9603, nDamageRand = 1, nCostMana = 0}, --level 4 --���ĵ�
	{nDamageBase = 9606, nDamageRand = 1, nCostMana = 0}, --level 5 --����
	{nDamageBase = 9607, nDamageRand = 1, nCostMana = 0}, --level 6 --��Ԫ��
	{nDamageBase = 9608, nDamageRand = 1, nCostMana = 0}, --level 7 --���е�
	{nDamageBase = 9609, nDamageRand = 1, nCostMana = 0}, --level 8 --��˪��
	{nDamageBase = 9610, nDamageRand = 1, nCostMana = 0}, --level 9 --��ѩ��
	{nDamageBase = 9611, nDamageRand = 1, nCostMana = 0}, --level 10--���鵤
	{nDamageBase = 9815, nDamageRand = 1, nCostMana = 0}, --level 11--��󸵤
	{nDamageBase = 9816, nDamageRand = 1, nCostMana = 0}, --level 12--�񻪵�
	{nDamageBase = 9612, nDamageRand = 1, nCostMana = 0}, --level 13--���鵤
	{nDamageBase = 9613, nDamageRand = 1, nCostMana = 0}, --level 14--���㵤
	{nDamageBase = 9614, nDamageRand = 1, nCostMana = 0}, --level 15--���൤
	{nDamageBase = 9615, nDamageRand = 1, nCostMana = 0}, --level 16--���ٵ�
	{nDamageBase = 9616, nDamageRand = 1, nCostMana = 0}, --level 17--ͨ�ܵ�
	{nDamageBase = 9617, nDamageRand = 1, nCostMana = 0}, --level 18--�ƾ���
	{nDamageBase = 9602, nDamageRand = 2, nCostMana = 0}, --level 19--�ѡ�������
	{nDamageBase = 9604, nDamageRand = 2, nCostMana = 0}, --level 20--�ѡ���ǵ�
	{nDamageBase = 9605, nDamageRand = 2, nCostMana = 0}, --level 21--�ѡ�����
	{nDamageBase = 9603, nDamageRand = 2, nCostMana = 0}, --level 22--�ѡ����ĵ�
	{nDamageBase = 9606, nDamageRand = 2, nCostMana = 0}, --level 23--�ѡ�����
	{nDamageBase = 9607, nDamageRand = 2, nCostMana = 0}, --level 24--�ѡ���Ԫ��
	{nDamageBase = 9608, nDamageRand = 2, nCostMana = 0}, --level 25--�ѡ����е�
	{nDamageBase = 9609, nDamageRand = 2, nCostMana = 0}, --level 26--�ѡ���˪��
	{nDamageBase = 9610, nDamageRand = 2, nCostMana = 0}, --level 27--�ѡ���ѩ��
	{nDamageBase = 9611, nDamageRand = 2, nCostMana = 0}, --level 28--�ѡ����鵤
	{nDamageBase = 9815, nDamageRand = 2, nCostMana = 0}, --level 29--�ѡ���󸵤
	{nDamageBase = 9816, nDamageRand = 2, nCostMana = 0}, --level 30--�ѡ��񻪵�
	{nDamageBase = 9612, nDamageRand = 2, nCostMana = 0}, --level 31--�ѡ����鵤
	{nDamageBase = 9613, nDamageRand = 2, nCostMana = 0}, --level 32--�ѡ����㵤
	{nDamageBase = 9614, nDamageRand = 2, nCostMana = 0}, --level 33--�ѡ����൤
	{nDamageBase = 9615, nDamageRand = 2, nCostMana = 0}, --level 34--�ѡ����ٵ�
	{nDamageBase = 9616, nDamageRand = 2, nCostMana = 0}, --level 35--�ѡ�ͨ�ܵ�
	{nDamageBase = 9617, nDamageRand = 2, nCostMana = 0}, --level 36--�ѡ��ƾ���
	{nDamageBase = 9798, nDamageRand = 1, nCostMana = 0}, --level 37--������
	{nDamageBase = 9799, nDamageRand = 1, nCostMana = 0}, --level 38--���ŵ�
	{nDamageBase = 9798, nDamageRand = 2, nCostMana = 0}, --level 39--�ѡ�������
	{nDamageBase = 9799, nDamageRand = 2, nCostMana = 0}, --level 40--�ѡ����ŵ�
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--[[if dwSkillLevel == 35  then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CURRENT_LIFE,
			20000,
			0
		);
	elseif dwSkillLevel == 36 then
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CURRENT_MANA,
			10000,
			0
		);
	else--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		tSkillData[dwSkillLevel].nDamageBase,
		tSkillData[dwSkillLevel].nDamageRand
	);
	--end

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
	skill.SetNormalCoolDown(1, 76);
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
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com