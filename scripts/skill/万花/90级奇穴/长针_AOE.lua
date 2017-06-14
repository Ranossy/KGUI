---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/90����Ѩ/����_AOE.lua
-- ����ʱ��:	2013/4/23 11:06:42
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_̫�ؾ���_����.lua
-- ������    :  ���	
-- ����ʱ��  :  2008-08-20
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  
-- �书��·  :  ̫�ؾ���
-- ��������  :  ����
-- ����Ч��  :  ֱ�Ӵ�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nTherapyBase = 503,	nTherapyRand = 50, nCostMana = 199 * 0.9},
	{ nTherapyBase = 539,	nTherapyRand = 54, nCostMana = 294 * 0.9},
	{ nTherapyBase = 575,	nTherapyRand = 58, nCostMana = 370 * 0.9},
	{ nTherapyBase = 611,	nTherapyRand = 61, nCostMana = 442 * 0.9},
	{ nTherapyBase = 647,	nTherapyRand = 65, nCostMana = 518 * 0.9},
	{ nTherapyBase = 683,	nTherapyRand = 68, nCostMana = 591 * 0.9},
	{ nTherapyBase = 719,	nTherapyRand = 72, nCostMana = 591 * 0.9},
	{ nTherapyBase = 755,	nTherapyRand = 76, nCostMana = 591 * 0.9},
	{ nTherapyBase = 791,	nTherapyRand = 79, nCostMana = 199 * 0.9},
	{ nTherapyBase = 827,	nTherapyRand = 83, nCostMana = 294 * 0.9},
	{ nTherapyBase = 863,	nTherapyRand = 86, nCostMana = 370 * 0.9},
	{ nTherapyBase = 899,	nTherapyRand = 90, nCostMana = 442 * 0.9},
	{ nTherapyBase = 935,	nTherapyRand = 94, nCostMana = 518 * 0.9},
	{ nTherapyBase = 971,	nTherapyRand = 97, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1007,	nTherapyRand = 101, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1043,	nTherapyRand = 104, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1079,	nTherapyRand = 108, nCostMana = 199 * 0.9},
	{ nTherapyBase = 1115,	nTherapyRand = 112, nCostMana = 294 * 0.9},
	{ nTherapyBase = 1151,	nTherapyRand = 115, nCostMana = 370 * 0.9},
	{ nTherapyBase = 1187,	nTherapyRand = 119, nCostMana = 442 * 0.9},
	{ nTherapyBase = 1223,	nTherapyRand = 122, nCostMana = 518 * 0.9},
	{ nTherapyBase = 1259,	nTherapyRand = 126, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1295,	nTherapyRand = 130, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1331,	nTherapyRand = 133, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1367,	nTherapyRand = 137, nCostMana = 442 * 0.9},
	{ nTherapyBase = 1403,	nTherapyRand = 140, nCostMana = 518 * 0.9},
	{ nTherapyBase = 1439,	nTherapyRand = 144, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1475,	nTherapyRand = 148, nCostMana = 591 * 0.9},
	{ nTherapyBase = 1511,	nTherapyRand = 150, nCostMana = 591 * 0.9},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
   	
	----------------- ħ������ -------------------------------------------------
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_THERAPY, -- ħ������
		tSkillData[dwSkillLevel].nTherapyBase/3/3, --����ֵ1
		0																--����ֵ2
	);
   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND, -- ħ������
		tSkillData[dwSkillLevel].nTherapyRand/3/3, --����ֵ1
		0																--����ֵ2
	);
   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_THERAPY, -- ħ������
		0, --����ֵ1
		0							--����ֵ2
	);
    

	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckDestOwnBuff(5669, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckSelfBuff(2968, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 126, 1)			-- ����Buff  dwSkillLevel��ע����ȼ�һ��
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(1, 592, 1);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);
	--skill.SetCheckCoolDown(1, 444)
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�������ע������ܵȼ�һ��
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
    
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 30 * LENGTH_BASE;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius = 8 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit = 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 56;				-- ����֡��
	skill.nChannelInterval = 77; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com