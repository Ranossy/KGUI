---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��������_����Ͱ�.lua
-- ����ʱ��:	2013/5/1 12:26:47
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_��������_����Ͱ�
-- ������    :  �º���
-- ����ʱ��  :  2008-08-25
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��������
-- ��������  :  ����Ͱ�
-- ����Ч��  :  �е����ƣ�����������𽣬��ɶ��������Ч����������״̬
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nCostMana = 280, nTherapy = 238*0.95, nTherapyRand = 238*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 253*0.95, nTherapyRand = 253*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 268*0.95, nTherapyRand = 268*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 283*0.95, nTherapyRand = 283*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 298*0.95, nTherapyRand = 298*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 313*0.95, nTherapyRand = 313*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 328*0.95, nTherapyRand = 328*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 343*0.95, nTherapyRand = 343*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 358*0.95, nTherapyRand = 358*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 373*0.95, nTherapyRand = 373*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 388*0.95, nTherapyRand = 388*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 403*0.95, nTherapyRand = 403*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 418*0.95, nTherapyRand = 418*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 433*0.95, nTherapyRand = 433*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 448*0.95, nTherapyRand = 448*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 463*0.95, nTherapyRand = 463*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 478*0.95, nTherapyRand = 478*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 493*0.95, nTherapyRand = 493*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 508*0.95, nTherapyRand = 508*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 523*0.95, nTherapyRand = 523*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 538*0.95, nTherapyRand = 538*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 553*0.95, nTherapyRand = 553*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 568*0.95, nTherapyRand = 568*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 583*0.95, nTherapyRand = 583*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 598*0.95, nTherapyRand = 598*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 613*0.95, nTherapyRand = 613*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 628*0.95, nTherapyRand = 628*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 643*0.95, nTherapyRand = 643*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 658*0.95, nTherapyRand = 658*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 673*0.95, nTherapyRand = 673*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 688*0.95, nTherapyRand = 688*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 703*0.95, nTherapyRand = 703*0.1, }, --level 2
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/��������_����Ͱ�.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nTherapy/2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nTherapyRand/2,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		0,
		0
		);
	--��Ѩ������Ѫֵ����50%Ŀ��������Ԫ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14729,
		1
		);
	--��������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CONSUME_BUFF, -- ����Buff
		680, -- ����ֵ1
		0																-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		505,
		1
	);
	--for i = 1, 6 do
		--skill.AddAttribute(
			--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			--ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			--"skill/����/�����ķ�_ȥ������.lua",
			--0
		--);
		--skill.AddAttribute(
			--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
			--ATTRIBUTE_TYPE.ACCUMULATE, -- ħ������
			---1, -- ����ֵ1
			--0														-- ����ֵ2
		--);
	
		--skill.AddAttribute(														--70���似��
			--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
			--6213,
			--1
		--);    
	
	--end
--   	skill.AddAttribute(
--   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,				-- ��������ģʽ
--   		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,							-- �ڹ����ԣ���صͰ�Ч��
--  		505,															-- ����ֵ1
--   		1																-- ����ֵ2
--   	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 680, 1);					-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);				--����CD1.5��
	skill.SetNormalCoolDown(1, 185);				--����CD6��
	skill.SetCheckCoolDown(1, 444);

	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 728 *0.8* 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 728*0.8 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 728*0.8*0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 728*0.8*0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 728*0.8;	-- �������ĵ�����
	end
	----------------- ������� -------------------------------------------------
	--   skill.bIsAccumulate	= true;				-- �����Ƿ���Ҫ����
	--   skill.SetSubsectionSkill(1, 1, 211, dwSkillLevel);
	--   skill.SetSubsectionSkill(2, 2, 212, dwSkillLevel);
	--   skill.SetSubsectionSkill(3, 10, 213, dwSkillLevel);
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 5 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 0;				-- ����֡��
	if dwSkillLevel < 10 then
  		skill.nChannelInterval = 90*1.05;
 	elseif dwSkillLevel < 32 then
  		skill.nChannelInterval = (90 + (dwSkillLevel - 9) * 4)*1.05
  	else
  		skill.nChannelInterval =190*1.05;     -- ͨ�������ʱ��   
 	end
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	skill.nBulletVelocity = 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 1024;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if player.GetBuff(1383, 2) then
		return nPreResult;
	end
	local nLevel = player.GetSkillLevel(537)
	if player.GetBuff(409, nLevel) then
		local	nBuff = player.GetBuff(409, nLevel)
		local   stackNum = nBuff.nStackNum
		if stackNum < 7  then			
			return false
		end
	end
	if player.GetBuff(409, nLevel + 7) then
		local	nBuff = player.GetBuff(409, nLevel + 7)
		local   stackNum = nBuff.nStackNum
		if stackNum < 7  then			
			return false
		end
	end
	if player.GetBuff(409, nLevel + 14) then
		local	nBuff = player.GetBuff(409, nLevel + 14)
		local   stackNum = nBuff.nStackNum
		if stackNum < 7  then			
			return false
		end
	end

	return nPreResult;
end


function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(53)
	end
	-- if player.IsAchievementAcquired(49) and player.IsAchievementAcquired(50) and player.IsAchievementAcquired(51) and player.IsAchievementAcquired(52) and player.IsAchievementAcquired(53) and player.IsAchievementAcquired(54) then
		-- player.AcquireAchievement(70)
	-- end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID,dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local rt
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	local lv = player.GetSkillLevel(556)
	if player.GetSkillLevel(5880) == 1 then
		player.CastSkill(6210, 1,player.GetSkillTarget())
		local buff = player.GetBuff(5927, 1)
		if  buff then
			rt =1 
		end
		if rt == 1 then
			target.AddBuff(dwSkillSrcID, player.nLevel, 5796, 1, 1)
			player.CastSkillXYZ(6211, lv, target.nX, target.nY, target.nZ)
			player.PlaySfx(486,target.nX,target.nY,target.nZ)
		end
	end

	ModityCDToUI(player, 555, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com