---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_�ٻ���Ѩ��_��������.lua
-- ����ʱ��:	2014/10/30 17:36:38
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_�ٻ���Ѩ��_��������.lua
-- ������    :  �Ͻ�
-- ����ʱ��  :  2008-8-12
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��������
-- �书��·  :  �ٻ���Ѩ��
-- ��������  :  ��������
-- ����Ч��  :  �Է���5����ʹ���κμ��ܣ���������6�룬�����������ʧ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 206}, -- Level 1
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 275}, -- Level 2
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 344}, -- Level 3
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 412}, -- Level 4
	{ nDamageBase = 0, nDamageRand = 0, nCostMana = 454}, -- Level 5

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--[[
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
   		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,								-- ħ������
   		tSkillData[dwSkillLevel].nDamageBase,							-- ����ֵ1
   		0																-- ����ֵ2
   		);
    --]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_�ٻ���Ѩ��_��������.lua",
		0
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(nType, dwBuffID, nStackNum)		-- ��������Buff
	--skill.AddSlowCheckDestBuff(nType, dwBuffID, nStackNum)		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	skill.BindBuff(1, 678, 5)			-- ����Buff
	--skill.BindDebuff(nDebuffID, nBuffLevel);		-- ����Debuff
	--skill.BindDot(nDotID, nDotLevel);				-- ����Dot
	--skill.BindHot(nHotID, nHotLevel);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);						-- ����CD 1.5��
	skill.SetNormalCoolDown(1, 179);
	skill.SetCheckCoolDown(1, 444)
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostRage		= 0;									-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	skill.nCostManaBasePercent = 152;	-- �������ĵ�����
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	skill.nMinPrepareFrames = 1;
	skill.nPrepareFrames = 16;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.bIsFormationSkill		= 0;			-- Ѫ����Сֵ>=
	--skill.TargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ������ -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID)  then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end

	--ͨ��ɾ��˲��buff
	if player.GetBuff(412, 1) then
		--ɾˮ��
		player.DelBuff(412, 1)
	elseif player.GetBuff(932, 1) then
		--ɾ��Ѹӿ
		player.DelBuff(932, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com